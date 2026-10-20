package gsb.airport

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AppAdminController {

    static allowedMethods = [
        updateBanner   : 'POST',
        createQuickLink: 'POST',
        updateQuickLink: 'POST',
        deleteQuickLink: 'POST'
    ]

    def index() {
        [
            bannerTextList: AppBannerText.list(sort: 'sortOrder', order: 'asc'),
            quickLinkList : AppQuickLink.list(sort: 'sortOrder', order: 'asc'),
            newQuickLink  : new AppQuickLink(active: true, openInNewWindow: true, category: 'Resources')
        ]
    }

    @Transactional
    def updateBanner(Long id) {
        AppBannerText bannerText = AppBannerText.get(id)
        if (!bannerText) {
            flash.message = 'Banner text was not found.'
            redirect action: 'index'
            return
        }

        bannerText.label = params.label?.toString()
        bannerText.textValue = params.textValue?.toString()
        bannerText.sortOrder = intParam('sortOrder', bannerText.sortOrder)
        bannerText.active = checked('active')

        if (!bannerText.save(flush: true)) {
            flash.message = 'Banner text could not be saved.'
        } else {
            flash.message = 'Banner text updated.'
        }
        redirect action: 'index'
    }

    @Transactional
    def createQuickLink() {
        AppQuickLink link = new AppQuickLink(
            label: params.label?.toString(),
            url: params.url?.toString(),
            category: params.category?.toString() ?: 'Resources',
            description: params.description?.toString(),
            sortOrder: intParam('sortOrder', 0),
            active: checked('active'),
            openInNewWindow: checked('openInNewWindow')
        )

        if (!link.save(flush: true)) {
            flash.message = 'Quick link could not be created.'
        } else {
            flash.message = 'Quick link created.'
        }
        redirect action: 'index'
    }

    @Transactional
    def updateQuickLink(Long id) {
        AppQuickLink link = AppQuickLink.get(id)
        if (!link) {
            flash.message = 'Quick link was not found.'
            redirect action: 'index'
            return
        }

        link.label = params.label?.toString()
        link.url = params.url?.toString()
        link.category = params.category?.toString() ?: 'Resources'
        link.description = params.description?.toString()
        link.sortOrder = intParam('sortOrder', link.sortOrder)
        link.active = checked('active')
        link.openInNewWindow = checked('openInNewWindow')

        if (!link.save(flush: true)) {
            flash.message = 'Quick link could not be saved.'
        } else {
            flash.message = 'Quick link updated.'
        }
        redirect url: returnPath(createLink(action: 'index')) // SINK: PLANTED-GR-HR-148
    }

    @Transactional
    def deleteQuickLink(Long id) {
        AppQuickLink link = AppQuickLink.get(id)
        if (link) {
            link.delete(flush: true)
            flash.message = 'Quick link deleted.'
        } else {
            flash.message = 'Quick link was not found.'
        }
        redirect url: localReturnPath(createLink(action: 'index')) // SAFE_SINK: PLANTED-GR-HR-148-safe
    }

    private String returnPath(String fallback) {
        String returnTo = params.returnTo?.toString()
        returnTo ? returnTo : fallback
    }

    private String localReturnPath(String fallback) {
        String returnTo = params.returnTo?.toString()
        (returnTo && returnTo ==~ /\/(?![\/\\])[A-Za-z0-9._~\/?=&%-]*/) ? request.contextPath + returnTo : fallback
    }

    private Integer intParam(String name, Integer defaultValue) {
        String value = params[name]?.toString()
        value?.isInteger() ? value.toInteger() : defaultValue
    }

    private boolean checked(String name) {
        params[name]?.toString() in ['true', 'on', '1', 'yes']
    }
}
