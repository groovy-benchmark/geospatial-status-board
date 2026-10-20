package gsb.airport

class AirportLookupOption {
    String category
    String value
    Integer sortOrder = 0
    Boolean active = true

    static constraints = {
        category nullable: false, blank: false, maxSize: 100
        value nullable: false, blank: false, maxSize: 255, unique: 'category'
        sortOrder nullable: true
        active nullable: false
    }

    static mapping = {
        table 'GSB_AIRPORT_LOOKUP_OPTION'
        version false
        sort sortOrder: 'asc'
    }

    static List<String> valuesFor(String category) {
        if (!category) {
            return []
        }

        findAllByCategoryAndActive(category, true, [sort: 'sortOrder', order: 'asc'])
            *.value
    }

    String toString() {
        value
    }
}
