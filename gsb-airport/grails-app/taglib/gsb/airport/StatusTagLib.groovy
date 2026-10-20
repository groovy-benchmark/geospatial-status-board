package gsb.airport

class StatusTagLib {
    static namespace = 'status'

    def badge = { attrs ->
        String value = attrs.value?.toString()
        if (!value) {
            return
        }

        String statusClass = statusClass(value)
        String width = attrs.width ?: '80px'
        String height = attrs.height ?: '20px'
        String extraClass = attrs.class ? " ${html(attrs.class.toString())}" : ''
        String safeValue = html(value)
        String safeWidth = cssSize(width)
        String safeHeight = cssSize(height)

        out << "<span class=\"gsb-status-badge gsb-status-${statusClass}${extraClass}\" " +
            "style=\"--gsb-status-width: ${safeWidth}; --gsb-status-height: ${safeHeight};\" " +
            "title=\"${safeValue}\" aria-label=\"${safeValue}\">" +
            "<span class=\"gsb-status-badge-text\">${safeValue}</span></span>"
    }

    private static String statusClass(String value) {
        String normalized = value?.trim()?.toUpperCase() ?: ''

        if (normalized.startsWith('GREEN')) {
            return 'green'
        }
        if (normalized.startsWith('YELLOW')) {
            return 'yellow'
        }
        if (normalized.startsWith('RED')) {
            return 'red'
        }
        if (normalized.startsWith('BLACK')) {
            return 'black'
        }
        if (normalized.startsWith('BLUE')) {
            return 'blue'
        }
        if (normalized in ['NA', 'N/A', 'NOT APPLICABLE']) {
            return 'na'
        }

        return 'unknown'
    }

    private static String cssSize(Object value) {
        String text = value?.toString()?.trim()
        if (!text) {
            return '80px'
        }

        text ==~ /(?i)^\d+(\.\d+)?(px|rem|em|%)$/ ? text : '80px'
    }

    private static String html(String value) {
        value
            .replace('&', '&amp;')
            .replace('<', '&lt;')
            .replace('>', '&gt;')
            .replace('"', '&quot;')
            .replace("'", '&#39;')
    }
}
