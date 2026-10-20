/*
 * 2017 6 23 - Mission Command Dev Team
 *
 */

package gsb.airport

import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional

@Secured(['ROLE_USER'])
@Transactional(readOnly = true, connection = 'geodbfour')
class CurrentSITController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", uploadSituationFile: "POST"]

    def index(Integer max) {
        //params.max = Math.min(max ?: 100, 100)
        respond CurrentSIT.findAllByActiveIsNotNull([max:100, sort:"sort", order:"asc"]), model: [CurrentSITCount: CurrentSIT.count()]

        //respond CurrentSIT.findAllByActiveIlike("YES", params), model: [CurrentSITCount: CurrentSIT.countByActiveIlike("YES")]

        //respond AirportStatus.findAllByActiveIsNotNull([max:50, sort:"sort", order:"asc"]), model: [airportStatusCount: AirportStatus.count()]
    }

    def show(Long id) {
        def currentSIT
        if (params.airfieldName) {
            currentSIT = CurrentSIT.findByAirfieldName('airFieldName')
        } else {
            currentSIT = CurrentSIT.get(id)
        }
        if (!currentSIT) {
            if (params.airfieldName) {
                flash.message = "Nothing found with name ${params.airfieldName}"
            } else {
                flash.message = "CurrentSIT not found with id $id"
            }
            redirect(action: "index")
            return
        }
        [currentSIT: currentSIT]
    }

    def create() {
        respond new CurrentSIT(params)
    }

    @Transactional(connection = 'geodbfour')
    def save(CurrentSIT currentSIT) {
        if (currentSIT == null) {
            notFound()
            return
        }

        if (currentSIT.hasErrors()) {
            respond currentSIT.errors, view: 'create'
            return
        }

        currentSIT.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'currentSIT.label', default: 'CurrentSIT'), currentSIT.id])
                redirect currentSIT
            }
            '*' { respond currentSIT, [status: CREATED] }
        }
    }

    def edit(CurrentSIT currentSIT) {
        respond currentSIT
    }

    @Transactional(connection = 'geodbfour')
    def update(CurrentSIT currentSIT) {
        if (currentSIT == null) {
            notFound()
            return
        }

        if (currentSIT.hasErrors()) {
            respond currentSIT.errors, view: 'edit'
            return
        }

        currentSIT.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CurrentSIT.label', default: 'CurrentSIT'), currentSIT.id])
                redirect currentSIT
            }
            '*' { respond currentSIT, [status: OK] }
        }
    }

    @Transactional(connection = 'geodbfour')
    def delete(CurrentSIT currentSIT) {

        if (currentSIT == null) {
            notFound()
            return
        }

        currentSIT.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CurrentSIT.label', default: 'CurrentSIT'), currentSIT.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    private static final String BRIEFING_ROOT = 'src/main/resources/static/uploads/sit-briefings'
    private static final String BRIEFING_VAULT = '/var/lib/gsb/sit-briefings'
    private static final Map<String, String> BRIEFING_EXT = ['image/png': 'png', 'image/jpeg': 'jpg']

    @Transactional(connection = 'geodbfour')
    def attachBriefing(Long id) {
        def currentSIT = CurrentSIT.get(id)
        def briefing = request.getFile('briefing')
        if (currentSIT == null || briefing == null || briefing.empty) {
            notFound()
            return
        }

        if (!briefing.contentType?.startsWith('image/')) {
            render status: UNSUPPORTED_MEDIA_TYPE, text: 'Briefing must be an image'
            return
        }

        File briefingFile = new File(BRIEFING_ROOT, new File(briefing.originalFilename).name)
        briefingFile.parentFile.mkdirs()
        briefing.transferTo(briefingFile) // SINK: PLANTED-GR-HR-67
        render status: CREATED, text: "uploads/sit-briefings/${briefingFile.name}"
    }

    @Transactional(connection = 'geodbfour')
    def attachBriefingChecked(Long id) {
        def currentSIT = CurrentSIT.get(id)
        def briefing = request.getFile('briefing')
        if (currentSIT == null || briefing == null || briefing.empty) {
            notFound()
            return
        }

        String ext = BRIEFING_EXT[briefing.contentType]
        if (!ext) {
            render status: UNSUPPORTED_MEDIA_TYPE, text: 'Briefing must be a png or jpeg image'
            return
        }

        File briefingFile = new File(BRIEFING_VAULT, "sit-${currentSIT.id}-${UUID.randomUUID()}.${ext}")
        briefingFile.parentFile.mkdirs()
        briefing.transferTo(briefingFile) // SAFE_SINK: PLANTED-GR-HR-67-safe
        render status: CREATED, text: "${currentSIT.id}"
    }

    @Transactional(connection = 'geodbfour')
    def uploadSituationFile(Long id) {
        def currentSIT = CurrentSIT.get(id)
        def upload = request.getFile('file')
        if (currentSIT == null || upload == null || upload.empty) {
            notFound()
            return
        }

        AttachmentUploader uploader = params.kind == 'import' ? new ImportAttachmentUploader() : new ImageAttachmentUploader()
        File stored = uploader.store(upload, "sit-${currentSIT.id}")
        if (stored == null) {
            render status: UNSUPPORTED_MEDIA_TYPE, text: 'File type not accepted'
            return
        }
        render status: CREATED, text: stored.name
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'currentSIT.label', default: 'CurrentSIT'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
