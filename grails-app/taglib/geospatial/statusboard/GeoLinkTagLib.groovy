package geospatial.statusboard

import grails.web.mapping.LinkGenerator
import org.springframework.web.util.HtmlUtils

class GeoLinkTagLib {

    static namespace = 'geo'

    LinkGenerator grailsLinkGenerator

    def mapLink = { attrs, body ->
        String layer = attrs.remove('layer')?.toString() ?: 'airportStatus'
        String field = attrs.remove('field')?.toString()
        Object value = attrs.remove('value')
        Object featureId = attrs.remove('featureId')
        String label = attrs.remove('label')?.toString()
        String cssClass = attrs.remove('class')?.toString() ?: attrs.remove('className')?.toString()
        String target = attrs.remove('target')?.toString()
        String title = attrs.remove('title')?.toString()
        String rel = attrs.remove('rel')?.toString()

        Map params = [layer: layer]
        if (field) {
            params.field = field
        }
        if (value != null && value.toString()) {
            params.value = value.toString()
        }
        if (featureId != null && featureId.toString()) {
            params.featureId = featureId.toString()
        }

        String href = grailsLinkGenerator.link(controller: 'map', action: 'index', params: params)
        String bodyText = body()?.toString()
        String content = bodyText ?: HtmlUtils.htmlEscape(label ?: 'Map')

        StringBuilder html = new StringBuilder()
        html << '<a href="' << HtmlUtils.htmlEscape(href) << '"'
        if (cssClass) {
            html << ' class="' << HtmlUtils.htmlEscape(cssClass) << '"'
        }
        if (target) {
            html << ' target="' << HtmlUtils.htmlEscape(target) << '"'
        }
        if (title) {
            html << ' title="' << HtmlUtils.htmlEscape(title) << '"'
        }
        if (rel) {
            html << ' rel="' << HtmlUtils.htmlEscape(rel) << '"'
        }
        html << '>' << content << '</a>'

        out << html.toString()
    }
}
