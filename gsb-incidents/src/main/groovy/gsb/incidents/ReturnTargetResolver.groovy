package gsb.incidents

/**
 * Decides where a form post should send the user back to.
 */
interface ReturnTargetResolver {
    String resolve(String returnTo, String fallback, String contextPath)
}
