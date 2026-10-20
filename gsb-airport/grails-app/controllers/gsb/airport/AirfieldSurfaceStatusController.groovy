package gsb.airport

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional

@Secured(['ROLE_USER'])
@Transactional(readOnly = true, connection = 'geodbfour')
class AirfieldSurfaceStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 200, 200)
        respond AirfieldSurfaceStatus.list(params), model: [airfieldSurfaceStatusCount: AirfieldSurfaceStatus.count()]
    }

    def show(AirfieldSurfaceStatus airfieldSurfaceStatus) {
        respond airfieldSurfaceStatus
    }

    def create() {
        respond new AirfieldSurfaceStatus(params)
    }

    @Transactional(connection = 'geodbfour')
    def save(AirfieldSurfaceStatus airfieldSurfaceStatus) {
        if (airfieldSurfaceStatus == null) {
            notFound()
            return
        }

        if (airfieldSurfaceStatus.hasErrors()) {
            respond airfieldSurfaceStatus.errors, view: 'create'
            return
        }

        airfieldSurfaceStatus.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'airfieldSurfaceStatus.label', default: 'gsb.airport.AirfieldSurfaceStatus'), airfieldSurfaceStatus.id])
                redirect airfieldSurfaceStatus
            }
            '*' { respond airfieldSurfaceStatus, [status: org.springframework.http.HttpStatus.CREATED] }
        }
    }

    def edit(AirfieldSurfaceStatus airfieldSurfaceStatus) {
        respond airfieldSurfaceStatus
    }

    @Transactional(connection = 'geodbfour')
    def update(AirfieldSurfaceStatus airfieldSurfaceStatus) {
        if (airfieldSurfaceStatus == null) {
            notFound()
            return
        }

        if (airfieldSurfaceStatus.hasErrors()) {
            respond airfieldSurfaceStatus.errors, view: 'edit'
            return
        }

        airfieldSurfaceStatus.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'gsb.airport.AirfieldSurfaceStatus.label', default: 'gsb.airport.AirfieldSurfaceStatus'), airfieldSurfaceStatus.id])
                redirect airfieldSurfaceStatus
            }
            '*' { respond airfieldSurfaceStatus, [status: org.springframework.http.HttpStatus.OK] }
        }
    }

    @Transactional(connection = 'geodbfour')
    def delete(AirfieldSurfaceStatus airfieldSurfaceStatus) {

        if (airfieldSurfaceStatus == null) {
            notFound()
            return
        }

        airfieldSurfaceStatus.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'gsb.airport.AirfieldSurfaceStatus.label', default: 'gsb.airport.AirfieldSurfaceStatus'), airfieldSurfaceStatus.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'airfieldSurfaceStatus.label', default: 'gsb.airport.AirfieldSurfaceStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NOT_FOUND }
        }
    }
}
