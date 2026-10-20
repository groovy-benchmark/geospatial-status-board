package gsb.incidents

/**
 * Keeps the behaviour of the old bookmarked forms: whatever return target the form carried is used.
 */
class LegacyReturnTargetResolver implements ReturnTargetResolver {
    @Override
    String resolve(String returnTo, String fallback, String contextPath) {
        returnTo ? returnTo : fallback
    }
}
