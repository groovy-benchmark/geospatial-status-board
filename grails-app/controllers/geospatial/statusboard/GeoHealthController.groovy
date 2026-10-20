package geospatial.statusboard

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonOutput

import javax.sql.DataSource
import java.sql.Connection
import java.sql.DriverManager
import java.sql.ResultSet
import java.sql.Statement
import java.time.Instant

@Secured(['ROLE_USER'])
class GeoHealthController {

    GrailsApplication grailsApplication
    DataSource dataSource

    def index() {
        Map geoConfig = asMap(grailsApplication.config.geo)
        Map geoserverConfig = asMap(geoConfig.geoserver)
        Map geoaiConfig = asMap(geoConfig.geoai)
        Map gatewayConfig = asMap(geoConfig.gateway)
        Map openclawConfig = asMap(geoConfig.openclaw)
        Map healthConfig = asMap(geoConfig.health)
        int timeoutMs = asInteger(healthConfig.requestTimeoutMs, 2500)

        Map payload = [
            checkedAt: Instant.now().toString(),
            services : [
                geoserver: checkHttp(
                    'GeoServer',
                    geoserverHealthUrl(geoserverConfig.wfsUrl?.toString()),
                    timeoutMs
                ),
                postgis  : checkPostgis(),
                geoai    : checkHttp(
                    'GeoAI API',
                    geoaiHealthUrl(geoaiConfig),
                    timeoutMs
                ),
                gateway  : checkHttp(
                    'Data Gateway',
                    gatewayHealthUrl(gatewayConfig),
                    timeoutMs
                ),
                openclaw : checkHttp(
                    'OpenClaw',
                    openclawHealthUrl(openclawConfig),
                    timeoutMs
                )
            ]
        ]

        render(contentType: 'application/json', text: JsonOutput.toJson(payload))
    }

    def probe() {
        Map geoConfig = asMap(grailsApplication.config.geo)
        int timeoutMs = asInteger(asMap(geoConfig.health).requestTimeoutMs, 2500)
        String mode = params.mode?.toString() ?: 'service'
        HttpURLConnection connection = null

        try {
            if (mode == 'custom') {
                String target = params.url?.toString()
                connection = new URL(target).openConnection() as HttpURLConnection // SINK: PLANTED-GR-HR-246
            } else {
                String known = knownProbeUrl(geoConfig, params.service?.toString())
                if (!known) {
                    response.status = 400
                    render(contentType: 'application/json', text: JsonOutput.toJson([status: 'error', message: 'Unknown service']))
                    return
                }
                connection = new URL(known).openConnection() as HttpURLConnection // SAFE_SINK: PLANTED-GR-HR-246-safe
            }
            connection.connectTimeout = timeoutMs
            connection.readTimeout = timeoutMs
            connection.requestMethod = 'GET'
            int code = connection.responseCode
            String body = code < 400 ? connection.inputStream.getText('UTF-8') : ''
            render(contentType: 'application/json', text: JsonOutput.toJson(
                status(code >= 200 && code < 400, mode, "HTTP ${code}", [sample: body.take(200)])
            ))
        } catch (Exception ex) {
            response.status = 502
            render(contentType: 'application/json', text: JsonOutput.toJson(
                status(false, mode, ex.message ?: ex.class.simpleName)
            ))
        } finally {
            connection?.disconnect()
        }
    }

    def reach() {
        Map geoConfig = asMap(grailsApplication.config.geo)
        int timeoutMs = asInteger(asMap(geoConfig.health).requestTimeoutMs, 2500)
        String via = params.via?.toString() ?: 'service'
        Socket socket = new Socket()

        try {
            if (via == 'manual') {
                socket.connect(new InetSocketAddress(params.host?.toString(), asInteger(params.port, 0)), timeoutMs) // SINK: PLANTED-GR-HR-321
            } else {
                Map endpoint = knownEndpoint(geoConfig, params.name?.toString())
                if (!endpoint) {
                    response.status = 400
                    render(contentType: 'application/json', text: JsonOutput.toJson([status: 'error', message: 'Unknown service']))
                    return
                }
                socket.connect(new InetSocketAddress(endpoint.host as String, endpoint.port as int), timeoutMs) // SAFE_SINK: PLANTED-GR-HR-321-safe
            }
            render(contentType: 'application/json', text: JsonOutput.toJson(status(true, via, 'TCP connect ok')))
        } catch (Exception ex) {
            response.status = 502
            render(contentType: 'application/json', text: JsonOutput.toJson(
                status(false, via, ex.message ?: ex.class.simpleName)
            ))
        } finally {
            socket.close()
        }
    }

    def dbcheck() {
        String profile = params.profile?.toString() ?: 'configured'
        Connection connection = null

        try {
            if (profile == 'custom') {
                connection = openPostgis([
                    host    : params.host?.toString(),
                    port    : asInteger(params.port, 5432),
                    database: params.db?.toString() ?: 'geostatusboard'
                ])
            } else {
                Map known = knownDatabases()[profile]
                if (!known) {
                    response.status = 400
                    render(contentType: 'application/json', text: JsonOutput.toJson([status: 'error', message: 'Unknown database profile']))
                    return
                }
                String fixedUrl = "jdbc:postgresql://${known.host}:${known.port}/${known.database}"
                connection = DriverManager.getConnection(fixedUrl, known.user as String, known.password as String) // SAFE_SINK: PLANTED-GR-HR-322-safe
            }
            render(contentType: 'application/json', text: JsonOutput.toJson(
                checkPostgisConnection(connection, [profile: profile])
            ))
        } catch (Exception ex) {
            response.status = 502
            render(contentType: 'application/json', text: JsonOutput.toJson(
                status(false, 'PostGIS', ex.message ?: ex.class.simpleName, [profile: profile])
            ))
        } finally {
            connection?.close()
        }
    }

    private Connection openPostgis(Map spec) {
        String user = System.getenv('POSTGIS_USER') ?: 'gsb'
        String password = System.getenv('POSTGIS_PASSWORD') ?: 'gsb'
        DriverManager.getConnection("jdbc:postgresql://${spec.host}:${spec.port}/${spec.database}", user, password) // SINK: PLANTED-GR-HR-322
    }

    private Map knownDatabases() {
        [
            configured: [
                host    : System.getenv('POSTGIS_HOST') ?: 'localhost',
                port    : asInteger(System.getenv('POSTGIS_PORT'), 5432),
                database: System.getenv('POSTGIS_DB') ?: 'geostatusboard',
                user    : System.getenv('POSTGIS_USER') ?: 'gsb',
                password: System.getenv('POSTGIS_PASSWORD') ?: 'gsb'
            ]
        ]
    }

    private Map knownEndpoint(Map geoConfig, String name) {
        if (name == 'postgis') {
            return [host: System.getenv('POSTGIS_HOST') ?: 'localhost', port: asInteger(System.getenv('POSTGIS_PORT'), 5432)]
        }

        Map endpointUrls = [
            geoserver: geoserverHealthUrl(asMap(geoConfig.geoserver).wfsUrl?.toString()),
            geoai    : geoaiHealthUrl(asMap(geoConfig.geoai)),
            gateway  : gatewayHealthUrl(asMap(geoConfig.gateway)),
            openclaw : openclawHealthUrl(asMap(geoConfig.openclaw))
        ]
        String url = name ? endpointUrls[name] : null
        if (!url) {
            return null
        }

        URI uri = new URI(url)
        uri.host ? [host: uri.host, port: uri.port > 0 ? uri.port : (uri.scheme == 'https' ? 443 : 80)] : null
    }

    private String knownProbeUrl(Map geoConfig, String service) {
        Map urls = [
            geoserver: geoserverHealthUrl(asMap(geoConfig.geoserver).wfsUrl?.toString()),
            geoai    : geoaiHealthUrl(asMap(geoConfig.geoai)),
            gateway  : gatewayHealthUrl(asMap(geoConfig.gateway)),
            openclaw : openclawHealthUrl(asMap(geoConfig.openclaw))
        ]
        service ? urls[service] : null
    }

    private Map checkHttp(String label, String url, int timeoutMs) {
        if (!url) {
            return status(false, label, 'Not configured')
        }

        HttpURLConnection connection = null
        try {
            connection = new URL(url).openConnection() as HttpURLConnection
            connection.connectTimeout = timeoutMs
            connection.readTimeout = timeoutMs
            connection.requestMethod = 'GET'
            int code = connection.responseCode
            boolean up = code >= 200 && code < 400
            return status(up, label, "HTTP ${code}", [url: url])
        } catch (Exception ex) {
            return status(false, label, ex.message ?: ex.class.simpleName, [url: url])
        } finally {
            connection?.disconnect()
        }
    }

    private Map checkPostgis() {
        try {
            Connection connection = dataSource.connection
            try {
                String product = connection.metaData.databaseProductName ?: 'database'
                if (!product.toLowerCase().contains('postgresql')) {
                    return checkConfiguredPostgis("App datasource is ${product}")
                }

                return checkPostgisConnection(connection, [:])
            } finally {
                connection.close()
            }
        } catch (Exception ex) {
            return checkConfiguredPostgis(ex.message ?: ex.class.simpleName)
        }
    }

    private Map checkConfiguredPostgis(String fallbackReason) {
        String host = System.getenv('POSTGIS_HOST') ?: 'localhost'
        String port = System.getenv('POSTGIS_PORT') ?: '5432'
        String db = System.getenv('POSTGIS_DB') ?: 'geostatusboard'
        String user = System.getenv('POSTGIS_USER') ?: 'gsb'
        String password = System.getenv('POSTGIS_PASSWORD') ?: 'gsb'
        String url = "jdbc:postgresql://${host}:${port}/${db}"

        try {
            Connection connection = DriverManager.getConnection(url, user, password)
            try {
                return checkPostgisConnection(connection, [
                    url: url,
                    datasource: fallbackReason
                ])
            } finally {
                connection.close()
            }
        } catch (Exception ex) {
            return status(false, 'PostGIS', ex.message ?: ex.class.simpleName, [
                url: url,
                datasource: fallbackReason
            ])
        }
    }

    private Map checkPostgisConnection(Connection connection, Map details) {
        Statement statement = connection.createStatement()
        try {
            ResultSet rs = statement.executeQuery('SELECT PostGIS_Version()')
            try {
                String version = rs.next() ? rs.getString(1) : 'available'
                return status(true, 'PostGIS', version, details)
            } finally {
                rs.close()
            }
        } finally {
            statement.close()
        }
    }

    private String geoserverHealthUrl(String wfsUrl) {
        if (!wfsUrl) {
            return ''
        }
        String separator = wfsUrl.contains('?') ? '&' : '?'
        "${wfsUrl}${separator}service=WFS&version=1.0.0&request=GetCapabilities"
    }

    private String geoaiHealthUrl(Map geoaiConfig) {
        String explicitHealthUrl = geoaiConfig.healthUrl?.toString()
        if (explicitHealthUrl) {
            return explicitHealthUrl
        }

        String apiUrl = geoaiConfig.apiUrl?.toString()
        apiUrl ? "${apiUrl.replaceAll('/+$', '')}/health" : ''
    }

    private String gatewayHealthUrl(Map gatewayConfig) {
        if (!asBoolean(gatewayConfig.enabled, true)) {
            return ''
        }

        String explicitHealthUrl = gatewayConfig.healthUrl?.toString()
        if (explicitHealthUrl) {
            return explicitHealthUrl
        }

        String hubUrl = gatewayConfig.hubUrl?.toString()
        if (!hubUrl) {
            return ''
        }

        String trimmed = hubUrl.replaceAll('/+$', '')
        int hubIndex = trimmed.indexOf('/hubs/')
        String baseUrl = hubIndex > 0 ? trimmed.substring(0, hubIndex) : trimmed
        "${baseUrl}/health"
    }

    private String openclawHealthUrl(Map openclawConfig) {
        if (!asBoolean(openclawConfig.enabled, true)) {
            return ''
        }

        String explicitHealthUrl = openclawConfig.healthUrl?.toString()
        if (explicitHealthUrl) {
            return explicitHealthUrl
        }

        String gatewayUrl = openclawConfig.gatewayUrl?.toString()
        gatewayUrl ? "${gatewayUrl.replaceAll('/+$', '')}/healthz" : ''
    }

    private Map status(boolean up, String label, String message, Map details = [:]) {
        [
            status : up ? 'up' : 'down',
            label  : label,
            message: message,
            details: details
        ]
    }

    private Map asMap(Object value) {
        if (value instanceof Map) {
            return value.collectEntries { Object key, Object entryValue ->
                [key.toString(), entryValue]
            }
        }

        [:]
    }

    private int asInteger(Object value, int defaultValue) {
        if (value == null) {
            return defaultValue
        }

        if (value instanceof Number) {
            return value as int
        }

        value.toString().isInteger() ? value.toString() as int : defaultValue
    }

    private boolean asBoolean(Object value, boolean defaultValue) {
        if (value == null) {
            return defaultValue
        }

        value instanceof Boolean ? value : value.toString().toBoolean()
    }
}
