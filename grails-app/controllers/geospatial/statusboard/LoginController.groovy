package geospatial.statusboard

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.context.MessageSource
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.AuthenticationTrustResolver
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.session.SessionAuthenticationException

import javax.servlet.http.HttpServletResponse

@Secured(['permitAll'])
class LoginController {

    AuthenticationTrustResolver authenticationTrustResolver
    MessageSource messageSource
    def springSecurityService

    def index() {
        if (springSecurityService.isLoggedIn()) {
            String next = params.next ?: securityConfig.successHandler.defaultTargetUrl
            redirect url: next // SINK: PLANTED-GR-HR-146
            return
        }

        redirect action: 'auth', params: params
    }

    def auth() {
        if (springSecurityService.isLoggedIn()) {
            String next = params.next?.toString()
            String target = (next && next ==~ /\/(?![\/\\])[A-Za-z0-9._~\/?=&%-]*/) ? request.contextPath + next : securityConfig.successHandler.defaultTargetUrl
            redirect url: target // SAFE_SINK: PLANTED-GR-HR-146-safe
            return
        }

        loginModel()
    }

    def authAjax() {
        response.setHeader 'Location', securityConfig.auth.ajaxLoginFormUrl as String
        render status: HttpServletResponse.SC_UNAUTHORIZED, text: 'Unauthorized'
    }

    def authfail() {
        String message = loginFailureMessage()

        if (springSecurityService.isAjax(request)) {
            render([error: message] as JSON)
            return
        }

        flash.message = message
        redirect action: 'auth', params: params
    }

    def denied() {
        if (springSecurityService.isLoggedIn() && authenticationTrustResolver.isRememberMe(authentication)) {
            redirect action: 'full', params: params
            return
        }

        [gspLayout: securityConfig.gsp.layoutDenied]
    }

    def full() {
        render view: 'auth', params: params, model: loginModel() + [
            hasCookie: authenticationTrustResolver.isRememberMe(authentication)
        ]
    }

    def ajaxSuccess() {
        render([success: true, username: authentication.name] as JSON)
    }

    def ajaxDenied() {
        render([error: 'access denied'] as JSON)
    }

    private Map loginModel() {
        ConfigObject conf = securityConfig

        [
            postUrl: request.contextPath + conf.apf.filterProcessesUrl,
            rememberMeParameter: conf.rememberMe.parameter,
            usernameParameter: conf.apf.usernameParameter,
            passwordParameter: conf.apf.passwordParameter,
            gspLayout: conf.gsp.layoutAuth
        ]
    }

    private String loginFailureMessage() {
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]

        if (exception instanceof AccountExpiredException) {
            return messageSource.getMessage('springSecurity.errors.login.expired', null, 'Account expired', request.locale)
        }

        if (exception instanceof CredentialsExpiredException) {
            return messageSource.getMessage('springSecurity.errors.login.passwordExpired', null, 'Password expired', request.locale)
        }

        if (exception instanceof DisabledException) {
            return messageSource.getMessage('springSecurity.errors.login.disabled', null, 'Account disabled', request.locale)
        }

        if (exception instanceof LockedException) {
            return messageSource.getMessage('springSecurity.errors.login.locked', null, 'Account locked', request.locale)
        }

        if (exception instanceof SessionAuthenticationException) {
            return messageSource.getMessage('springSecurity.errors.login.max.sessions.exceeded', null, 'Maximum sessions exceeded', request.locale)
        }

        messageSource.getMessage('springSecurity.errors.login.fail', null, 'Authentication failed', request.locale)
    }

    private Authentication getAuthentication() {
        SecurityContextHolder.context?.authentication
    }

    private ConfigObject getSecurityConfig() {
        SpringSecurityUtils.securityConfig
    }
}
