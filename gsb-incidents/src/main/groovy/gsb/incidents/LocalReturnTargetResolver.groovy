package gsb.incidents

/**
 * Only returns to a page inside this application.
 */
class LocalReturnTargetResolver implements ReturnTargetResolver {
    private static final String LOCAL_PATH = /\/(?![\/\\])[A-Za-z0-9._~\/?=&%-]*/

    @Override
    String resolve(String returnTo, String fallback, String contextPath) {
        (returnTo && returnTo ==~ LOCAL_PATH) ? contextPath + returnTo : fallback
    }
}
