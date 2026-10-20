package gsb.airport

class AppBannerText {
    String slot
    String label
    String textValue
    Integer sortOrder = 0
    Boolean active = true

    static constraints = {
        slot nullable: false, blank: false, maxSize: 80, unique: true
        label nullable: false, blank: false, maxSize: 100
        textValue nullable: true, blank: true, maxSize: 500
        sortOrder nullable: true
        active nullable: false
    }

    static mapping = {
        table 'GSB_APP_BANNER_TEXT'
        version false
        sort sortOrder: 'asc'
        textValue column: 'TEXT_VALUE'
    }

    static String textFor(String slot, String defaultText = '') {
        AppBannerText row = slot ? findBySlotAndActive(slot, true) : null
        row?.textValue ?: defaultText
    }

    String toString() {
        "${label}: ${textValue ?: ''}"
    }
}
