package gsb.airport

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional

@Secured(['ROLE_USER'])
@Transactional(readOnly = true, connection = 'geodbfour')
class AirportStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        respond AirportStatus.findAllByActiveIsNotNull([max: 50, sort: "sort", order: "asc"]), model: [airportStatusCount: AirportStatus.count()]
    }

    def show(AirportStatus airportStatus) {
        respond airportStatus
    }

    def create() {
        respond new AirportStatus(params)
    }

    @Transactional(connection = 'geodbfour')
    def save(AirportStatus airportStatus) {
        if (airportStatus == null) {
            notFound()
            return
        }

        if (airportStatus.hasErrors()) {
            respond airportStatus.errors, view: 'create'
            return
        }

        airportStatus.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'airportStatus.label', default: 'gsb.airport.AirportStatus'), airportStatus.id])
                redirect airportStatus
            }
            '*' { respond airportStatus, [status: org.springframework.http.HttpStatus.CREATED] }
        }
    }

    def edit(AirportStatus airportStatus) {
        respond airportStatus
    }

    @Transactional(connection = 'geodbfour')
    def update(AirportStatus airportStatus) {
        if (airportStatus == null) {
            notFound()
            return
        }

        if (airportStatus.hasErrors()) {
            respond airportStatus.errors, view: 'edit'
            return
        }

        airportStatus.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'gsb.airport.AirportStatus.label', default: 'gsb.airport.AirportStatus'), airportStatus.id])
                redirect airportStatus
            }
            '*' { respond airportStatus, [status: org.springframework.http.HttpStatus.OK] }
        }
    }

    @Transactional(connection = 'geodbfour')
    def delete(AirportStatus airportStatus) {

        if (airportStatus == null) {
            notFound()
            return
        }

        airportStatus.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'gsb.airport.AirportStatus.label', default: 'gsb.airport.AirportStatus'), airportStatus.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'airportStatus.label', default: 'gsb.airport.AirportStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NOT_FOUND }
        }
    }
}
