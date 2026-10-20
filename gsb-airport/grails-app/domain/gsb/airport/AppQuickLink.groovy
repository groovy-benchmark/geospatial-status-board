package gsb.airport

class AppQuickLink {
    String label
    String url
    String category = 'Resources'
    String description
    Integer sortOrder = 0
    Boolean active = true
    Boolean openInNewWindow = true

    static constraints = {
        label nullable: false, blank: false, maxSize: 120
        url nullable: false, blank: false, maxSize: 1000
        category nullable: false, blank: false, maxSize: 100
        description nullable: true, blank: true, maxSize: 255
        sortOrder nullable: true
        active nullable: false
        openInNewWindow nullable: false
    }

    static mapping = {
        table 'GSB_APP_QUICK_LINK'
        version false
        sort sortOrder: 'asc'
        openInNewWindow column: 'OPEN_NEW_WINDOW'
    }

    static List<AppQuickLink> activeLinks() {
        findAllByActive(true, [sort: 'sortOrder', order: 'asc'])
    }

    String toString() {
        label
    }
}
