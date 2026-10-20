%{--
  - 2017 6 22 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.NavaidController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'navaid.label', default: 'Navaid')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-navaid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-navaid" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list navaid">

        <g:if test="${navaid?.airfieldName}">
            <li class="fieldcontain">
                <span id="airfieldName-label" class="property-label"><g:message code="navaid.airfieldName.label" default="Airport"/></span>

                <span class="property-value" aria-labelledby="airfieldName-label"><g:fieldValue bean="${navaid}" field="airfieldName"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="navaid.owner.label" default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:fieldValue bean="${navaid}" field="owner"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.navaidName}">
            <li class="fieldcontain">
                <span id="navaidName-label" class="property-label"><g:message code="navaid.navaidName.label" default="NAVAID Name"/></span>

                <span class="property-value" aria-labelledby="navaidName-label"><g:fieldValue bean="${navaid}" field="navaidName"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.navaidType}">
            <li class="fieldcontain">
                <span id="navaidType-label" class="property-label"><g:message code="navaid.navaidType.label" default="NAVAID Type"/></span>

                <span class="property-value" aria-labelledby="navaidType-label"><g:fieldValue bean="${navaid}" field="navaidType"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="navaid.status.label" default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${navaid}" field="status"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.statusNote}">
            <li class="fieldcontain">
                <span id="statusNote-label" class="property-label"><g:message code="navaid.statusNote.label" default="Status Note"/></span>

                <span class="property-value" aria-labelledby="statusNote-label"><g:fieldValue bean="${navaid}" field="statusNote"/></span>

            </li>
        </g:if>

        <g:if test="${navaid?.updatedBy}">
            <li class="fieldcontain">
                <span id="updatedBy-label" class="property-label"><g:message code="navaid.updatedBy.label"
                                                                             default="Updated By"/></span>

                <span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue
                        bean="${navaid}" field="updatedBy"/></span>
            </li>
        </g:if>

        <g:if test="${navaid?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="navaid.lastUpdated.label" default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"  date="${navaid?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: navaid, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${navaid}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
