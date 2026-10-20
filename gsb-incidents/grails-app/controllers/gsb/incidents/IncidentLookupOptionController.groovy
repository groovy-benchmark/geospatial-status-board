package gsb.incidents

import grails.gorm.transactions.Transactional
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class IncidentLookupOptionController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index(Integer max) {
        params.max = Math.min(max ?: 100, 500)
        respond IncidentLookupOption.list(params), model: [incidentLookupOptionCount: IncidentLookupOption.count()]
    }

    def show(IncidentLookupOption incidentLookupOption) {
        respond incidentLookupOption
    }

    def create() {
        respond new IncidentLookupOption(params)
    }

    @Transactional
    def save(IncidentLookupOption incidentLookupOption) {
        if (incidentLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (incidentLookupOption.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond incidentLookupOption.errors, view: 'create'
            return
        }

        incidentLookupOption.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option'), incidentLookupOption.id])
                redirect incidentLookupOption
            }
            '*' { respond incidentLookupOption, [status: CREATED] }
        }
    }

    def edit(IncidentLookupOption incidentLookupOption) {
        respond incidentLookupOption
    }

    @Transactional
    def update(IncidentLookupOption incidentLookupOption) {
        if (incidentLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (incidentLookupOption.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond incidentLookupOption.errors, view: 'edit'
            return
        }

        incidentLookupOption.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option'), incidentLookupOption.id])
                redirect incidentLookupOption
            }
            '*' { respond incidentLookupOption, [status: OK] }
        }
    }

    @Transactional
    def delete(IncidentLookupOption incidentLookupOption) {
        if (incidentLookupOption == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        incidentLookupOption.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option'), incidentLookupOption.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option'), params.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
