package gsb.airport

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class AirportLookupOptionController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index(Integer max) {
        params.max = Math.min(max ?: 100, 500)
        respond AirportLookupOption.list(params), model: [airportLookupOptionCount: AirportLookupOption.count()]
    }

    def show(AirportLookupOption airportLookupOption) {
        respond airportLookupOption
    }

    def create() {
        respond new AirportLookupOption(params)
    }

    @Transactional
    def save(AirportLookupOption airportLookupOption) {
        if (airportLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (airportLookupOption.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond airportLookupOption.errors, view: 'create'
            return
        }

        airportLookupOption.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'airportLookupOption.label', default: 'Airport Lookup Option'), airportLookupOption.id])
                redirect airportLookupOption
            }
            '*' { respond airportLookupOption, [status: CREATED] }
        }
    }

    def edit(AirportLookupOption airportLookupOption) {
        respond airportLookupOption
    }

    @Transactional
    def update(AirportLookupOption airportLookupOption) {
        if (airportLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (airportLookupOption.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond airportLookupOption.errors, view: 'edit'
            return
        }

        airportLookupOption.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'airportLookupOption.label', default: 'Airport Lookup Option'), airportLookupOption.id])
                redirect airportLookupOption
            }
            '*' { respond airportLookupOption, [status: OK] }
        }
    }

    @Transactional
    def delete(AirportLookupOption airportLookupOption) {
        if (airportLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        airportLookupOption.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'airportLookupOption.label', default: 'Airport Lookup Option'), airportLookupOption.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'airportLookupOption.label', default: 'Airport Lookup Option'), params.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
