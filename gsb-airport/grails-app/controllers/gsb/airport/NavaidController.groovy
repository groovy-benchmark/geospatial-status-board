/*
 * 2017 6 22 - Mission Command Dev Team
 *
 */

package gsb.airport

import grails.gorm.transactions.Transactional
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_USER'])
@Transactional(readOnly = true, connection = 'geodbfour')
class NavaidController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 100, 200)
        respond Navaid.list(params), model: [navaidInstanceCount: Navaid.count()]
    }

    def show(Navaid navaidInstance) {
        respond navaidInstance
    }

    def create() {
        respond new Navaid(params)
    }

    @Transactional(connection = 'geodbfour')
    def save(Navaid navaidInstance) {
        if (navaidInstance == null) {
            notFound()
            return
        }

        if (navaidInstance.hasErrors()) {
            respond navaidInstance.errors, view: 'create'
            return
        }

        navaidInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'navaid.label', default: 'Navaid'), navaidInstance.id])
                redirect navaidInstance
            }
            '*' { respond navaidInstance, [status: CREATED] }
        }
    }

    def edit(Navaid navaidInstance) {
        respond navaidInstance
    }

    @Transactional(connection = 'geodbfour')
    def update(Navaid navaidInstance) {
        if (navaidInstance == null) {
            notFound()
            return
        }

        if (navaidInstance.hasErrors()) {
            respond navaidInstance.errors, view: 'edit'
            return
        }

        navaidInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Navaid.label', default: 'Navaid'), navaidInstance.id])
                redirect navaidInstance
            }
            '*' { respond navaidInstance, [status: OK] }
        }
    }

    @Transactional(connection = 'geodbfour')
    def delete(Navaid navaidInstance) {

        if (navaidInstance == null) {
            notFound()
            return
        }

        navaidInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Navaid.label', default: 'Navaid'), navaidInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    private static final String CHART_ROOT = 'src/main/resources/static/uploads/navaid-charts'
    private static final String CHART_VAULT = '/var/lib/gsb/navaid-charts'
    private static final List<String> CHART_TYPES = ['png', 'jpg', 'gif']

    @Transactional(connection = 'geodbfour')
    def uploadChart(Long id) {
        def navaidInstance = Navaid.get(id)
        def chart = request.getFile('chart')
        if (navaidInstance == null || chart == null || chart.empty) {
            notFound()
            return
        }

        String chartName = chart.originalFilename
        String ext = chartName.substring(chartName.lastIndexOf('.'))
        File chartFile = new File(CHART_ROOT, "navaid-${navaidInstance.id}${ext}")
        chartFile.parentFile.mkdirs()
        chart.transferTo(chartFile) // SINK: PLANTED-GR-HR-66
        render status: CREATED, text: "uploads/navaid-charts/${chartFile.name}"
    }

    @Transactional(connection = 'geodbfour')
    def uploadChartChecked(Long id) {
        def navaidInstance = Navaid.get(id)
        def chart = request.getFile('chart')
        if (navaidInstance == null || chart == null || chart.empty) {
            notFound()
            return
        }

        String ext = chart.originalFilename.tokenize('.').last().toLowerCase()
        if (!(ext in CHART_TYPES)) {
            render status: UNSUPPORTED_MEDIA_TYPE, text: 'Chart must be a png, jpg or gif image'
            return
        }

        File chartFile = new File(CHART_VAULT, "${UUID.randomUUID()}.${ext}")
        chartFile.parentFile.mkdirs()
        chart.transferTo(chartFile) // SAFE_SINK: PLANTED-GR-HR-66-safe
        render status: CREATED, text: "${navaidInstance.id}"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'navaid.label', default: 'Navaid'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
