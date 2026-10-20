package geospatial.statusboard

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonOutput

@Secured(['ROLE_USER'])
class IncidentAnalystController {

    GrailsApplication grailsApplication

    def index() {
        Map incidentConfig = asMap(asMap(grailsApplication.config.geo).incidentAnalyst)

        if (!asBoolean(incidentConfig.enabled, true)) {
            response.status = 404
            render view: '/notFound'
            return
        }

        Map forwardedParams = params.collectEntries { Object key, Object value -> [(key.toString()): value] }
        forwardedParams.incidentAnalyst = 'true'
        forward controller: 'map', action: 'index', params: forwardedParams
    }

    def analyze() {
        proxyBridgeGet('/api/analyze')
    }

    def osmSupport() {
        proxyBridgeGet('/api/osm/support')
    }

    def enrich() {
        String target = params.target?.toString()
        if (!target) {
            response.status = 400
            renderJson([status: 'error', message: 'Target is required'])
            return
        }

        IncidentSourceFetcher fetcher = fetcherFor(params.mode?.toString())
        try {
            renderJson([status: 'ok', target: target, content: fetcher.fetch(target)])
        } catch (Exception ex) {
            response.status = 502
            renderJson([status: 'error', message: ex.message ?: ex.class.simpleName])
        }
    }

    private IncidentSourceFetcher fetcherFor(String mode) {
        mode == 'catalog' ? new CatalogIncidentSourceFetcher() : new DirectIncidentSourceFetcher()
    }

    private void proxyBridgeGet(String path) {
        Map incidentConfig = asMap(asMap(grailsApplication.config.geo).incidentAnalyst)
        if (!asBoolean(incidentConfig.enabled, true)) {
            response.status = 404
            renderJson([status: 'error', message: 'Incident Analyst is disabled'])
            return
        }

        String bridgeUrl = incidentConfig.bridgeUrl?.toString()?.replaceAll('/+$', '') ?: 'http://127.0.0.1:8775/incident-analyst'
        int timeoutMs = asInteger(incidentConfig.requestTimeoutMs, 8000)
        String query = request.queryString ? "?${request.queryString}" : ''
        HttpURLConnection connection = null

        try {
            connection = new URL("${bridgeUrl}${path}${query}").openConnection() as HttpURLConnection
            connection.connectTimeout = timeoutMs
            connection.readTimeout = timeoutMs
            connection.requestMethod = 'GET'
            connection.setRequestProperty('Accept', 'application/json')

            int code = connection.responseCode
            String text = readResponse(connection, code)
            response.status = code
            render(contentType: 'application/json', text: text ?: '{}')
        } catch (Exception ex) {
            response.status = 503
            renderJson([
                status : 'error',
                message: ex.message ?: ex.class.simpleName,
                service: 'Incident Analyst bridge'
            ])
        } finally {
            connection?.disconnect()
        }
    }

    private String readResponse(HttpURLConnection connection, int code) {
        InputStream stream = code >= 400 ? connection.errorStream : connection.inputStream
        stream ? stream.getText('UTF-8') : ''
    }

    private void renderJson(Map payload) {
        render(contentType: 'application/json', text: JsonOutput.toJson(payload))
    }

    private Map asMap(Object value) {
        if (value instanceof Map) {
            return value.collectEntries { Object key, Object entryValue ->
                [key.toString(), entryValue]
            }
        }

        [:]
    }

    private boolean asBoolean(Object value, boolean defaultValue) {
        if (value == null) {
            return defaultValue
        }

        value instanceof Boolean ? value : value.toString().toBoolean()
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
}

interface IncidentSourceFetcher {
    String fetch(String target)
}

class DirectIncidentSourceFetcher implements IncidentSourceFetcher {
    @Override
    String fetch(String target) {
        target.toURL().getText('UTF-8') // SINK: PLANTED-GR-HR-248
    }
}

class CatalogIncidentSourceFetcher implements IncidentSourceFetcher {
    private static final Map<String, String> SOURCES = [
        analyze: 'http://127.0.0.1:8775/incident-analyst/api/analyze',
        osm    : 'http://127.0.0.1:8775/incident-analyst/api/osm/support'
    ]

    @Override
    String fetch(String target) {
        String known = SOURCES[target]
        if (!known) {
            throw new IllegalArgumentException("Unknown incident source: ${target}")
        }
        known.toURL().getText('UTF-8') // SAFE_SINK: PLANTED-GR-HR-248-safe
    }
}
