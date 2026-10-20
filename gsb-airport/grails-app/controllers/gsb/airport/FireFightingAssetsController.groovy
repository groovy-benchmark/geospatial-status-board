package gsb.airport

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional

@Secured(['ROLE_USER'])
@Transactional(readOnly = true, connection = 'geodbfour')
class FireFightingAssetsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 500, 500)
        if (params.airfieldName) {
            respond FireFightingAssets.findAllByAirfieldNameLike(params.airfieldName).asList().sort {
                it.itemName
            }, model: [fireFightingAssetsCount: FireFightingAssets.count()]
        } else {
            respond FireFightingAssets.list(params), model: [fireFightingAssetsCount: FireFightingAssets.count()]
        }
    }

    def show(Long id) {
        def fireFightingAssets
        if (params.airfieldName) {
            fireFightingAssets = FireFightingAssets.findByAirfieldName(params.airfieldName)
        } else {
            fireFightingAssets = FireFightingAssets.get(id)
        }
        if (!fireFightingAssets) {
            if (params.airfieldName) {
                flash.message = "Nothing found with name ${params.airfieldName}"
            } else {
                flash.message = "gsb.airport.FireFightingAssets not found with id $id"
            }
            redirect(action: "index")
            return
        }
        [fireFightingAssets: fireFightingAssets]
    }

    def create() {
        respond new FireFightingAssets(params)
    }

    @Transactional(connection = 'geodbfour')
    def save(FireFightingAssets fireFightingAssets) {
        if (fireFightingAssets == null) {
            notFound()
            return
        }

        if (fireFightingAssets.hasErrors()) {
            respond fireFightingAssets.errors, view: 'create'
            return
        }

        fireFightingAssets.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fireFightingAssets.label', default: 'gsb.airport.FireFightingAssets'), fireFightingAssets.id])
                redirect fireFightingAssets
            }
            '*' { respond fireFightingAssets, [status: org.springframework.http.HttpStatus.CREATED] }
        }
    }

    def edit(FireFightingAssets fireFightingAssets) {
        respond fireFightingAssets
    }

    @Transactional(connection = 'geodbfour')
    def update(FireFightingAssets fireFightingAssets) {
        if (fireFightingAssets == null) {
            notFound()
            return
        }

        if (fireFightingAssets.hasErrors()) {
            respond fireFightingAssets.errors, view: 'edit'
            return
        }

        fireFightingAssets.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'gsb.airport.FireFightingAssets.label', default: 'gsb.airport.FireFightingAssets'), fireFightingAssets.id])
                redirect fireFightingAssets
            }
            '*' { respond fireFightingAssets, [status: org.springframework.http.HttpStatus.OK] }
        }
    }

    @Transactional(connection = 'geodbfour')
    def delete(FireFightingAssets fireFightingAssets) {

        if (fireFightingAssets == null) {
            notFound()
            return
        }

        fireFightingAssets.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'gsb.airport.FireFightingAssets.label', default: 'gsb.airport.FireFightingAssets'), fireFightingAssets.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fireFightingAssets.label', default: 'gsb.airport.FireFightingAssets'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: org.springframework.http.HttpStatus.NOT_FOUND }
        }
    }
}
