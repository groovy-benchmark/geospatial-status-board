package geospatial.statusboard

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.web.RedirectStrategy

import javax.servlet.http.HttpServletResponse

@Secured(['permitAll'])
class LogoutController {

    RedirectStrategy redirectStrategy

    def index() {
        if (!request.post && SpringSecurityUtils.securityConfig.logout.postOnly) {
            response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED
            return
        }

        String landing = params.next ?: (SpringSecurityUtils.securityConfig.logout.filterProcessesUrl as String)
        redirectStrategy.sendRedirect request, response, landing // SINK: PLANTED-GR-HR-147
        response.flushBuffer()
    }

    def landing() {
        Map targets = [login: '/login/auth', home: '/']
        String destination = targets[params.dest?.toString()] ?: '/'
        redirectStrategy.sendRedirect request, response, destination // SAFE_SINK: PLANTED-GR-HR-147-safe
        response.flushBuffer()
    }
}
