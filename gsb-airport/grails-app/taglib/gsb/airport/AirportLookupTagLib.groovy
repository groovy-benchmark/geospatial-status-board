package gsb.airport

class AirportLookupTagLib {
    static namespace = 'airportLookup'

    def select = { attrs ->
        String category = attrs.remove('category')?.toString()
        attrs.from = AirportLookupOption.valuesFor(category)
        out << g.select(attrs)
    }
}
