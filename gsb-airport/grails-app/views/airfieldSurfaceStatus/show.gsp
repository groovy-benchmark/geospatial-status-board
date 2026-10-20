%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.AirfieldSurfaceStatusController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_abs_18">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'airfieldSurfaceStatus.label', default: 'AirfieldSurfaceStatus')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-airfieldSurfaceStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-airfieldSurfaceStatus" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list airfieldSurfaceStatus">

        <g:if test="${airfieldSurfaceStatus?.airfieldName}">
            <li class="fieldcontain">
                <span id="airfieldName-label" class="property-label"><g:message code="airfieldSurfaceStatus.airfieldName.label" default="Airfield Name"/></span>

                <span class="property-value" aria-labelledby="airfieldName-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="airfieldName"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.runway}">
            <li class="fieldcontain">
                <span id="runway-label" class="property-label"><g:message code="airfieldSurfaceStatus.runway.label" default="Runway"/></span>

                <span class="property-value" aria-labelledby="runway-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="runway"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.sectionLabel}">
            <li class="fieldcontain">
                <span id="sectionLabel-label" class="property-label"><g:message code="airfieldSurfaceStatus.sectionLabel.label" default="Section Label"/></span>

                <span class="property-value" aria-labelledby="sectionLabel-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="sectionLabel"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.condition}">
            <li class="fieldcontain">
                <span id="condition-label" class="property-label"><g:message code="airfieldSurfaceStatus.condition.label" default="Condition"/></span>

                <span class="property-value" aria-labelledby="condition-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="condition"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.notes}">
            <li class="fieldcontain">
                <span id="notes-label" class="property-label"><g:message code="airfieldSurfaceStatus.notes.label" default="Notes"/></span>

                <span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="notes"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.repairStatus}">
            <li class="fieldcontain">
                <span id="repairStatus-label" class="property-label"><g:message code="airfieldSurfaceStatus.repairStatus.label" default="Repair Status"/></span>

                <span class="property-value" aria-labelledby="repairStatus-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="repairStatus"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.updatedBy}">
            <li class="fieldcontain">
                <span id="updatedBy-label" class="property-label"><g:message code="airfieldSurfaceStatus.updatedBy.label" default="Updated By"/></span>

                <span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue bean="${airfieldSurfaceStatus}" field="updatedBy"/></span>

            </li>
        </g:if>

        <g:if test="${airfieldSurfaceStatus?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="airfieldSurfaceStatus.lastUpdated.label" default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"  date="${airfieldSurfaceStatus?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: airfieldSurfaceStatus, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit

" action="edit" resource="${airfieldSurfaceStatus}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
