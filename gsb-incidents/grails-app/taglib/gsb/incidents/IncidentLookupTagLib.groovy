package gsb.incidents

class IncidentLookupTagLib {
    static namespace = 'incidentLookup'

    def select = { attrs ->
        String category = attrs.remove('category')?.toString()
        attrs.from = IncidentLookupOption.valuesFor(category)
        out << g.select(attrs)
    }
}
