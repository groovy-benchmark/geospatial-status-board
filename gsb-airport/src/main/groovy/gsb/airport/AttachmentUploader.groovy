package gsb.airport

/**
 * Stores files uploaded against a situation report. The flavour (image vs. bulk import)
 * is selected by the controller; each flavour decides where and under what name to keep the file.
 */
abstract class AttachmentUploader {
    static final String PUBLIC_ROOT = 'src/main/resources/static/uploads/sit-files'
    static final String VAULT_ROOT = '/var/lib/gsb/sit-files'

    abstract File store(upload, String prefix)
}

/** Bulk-import flavour: keeps the operator's original file name so exports round-trip. */
class ImportAttachmentUploader extends AttachmentUploader {
    File store(upload, String prefix) {
        File target = new File(PUBLIC_ROOT, "${prefix}-${new File(upload.originalFilename).name}")
        target.parentFile.mkdirs()
        upload.transferTo(target) // SINK: PLANTED-GR-HR-70
        target
    }
}

/** Image flavour: only png/jpg/gif, stored under a generated name outside the served tree. */
class ImageAttachmentUploader extends AttachmentUploader {
    static final List<String> IMAGE_TYPES = ['png', 'jpg', 'gif']

    File store(upload, String prefix) {
        String ext = upload.originalFilename.tokenize('.').last().toLowerCase()
        if (!(ext in IMAGE_TYPES)) {
            return null
        }

        File target = new File(VAULT_ROOT, "${prefix}-${UUID.randomUUID()}.${ext}")
        target.parentFile.mkdirs()
        upload.transferTo(target) // SAFE_SINK: PLANTED-GR-HR-70-safe
        target
    }
}
