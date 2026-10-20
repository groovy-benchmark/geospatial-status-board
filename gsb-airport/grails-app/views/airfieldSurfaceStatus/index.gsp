%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.AirfieldSurfaceStatusController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'airfieldSurfaceStatus.label', default: 'AirfieldSurfaceStatus')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-airfieldSurfaceStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-airfieldSurfaceStatus" class="content scaffold-list" role="main">
    <h1>Airfield Surface Status</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="airfieldName" title="${message(code: 'airfieldSurfaceStatus.airfieldName.label', default: 'Airfield Name')}"/>

            <g:sortableColumn property="runway" title="${message(code: 'airfieldSurfaceStatus.runway.label', default: 'Runway')}"/>

            <g:sortableColumn property="sectionLabel" title="${message(code: 'airfieldSurfaceStatus.sectionLabel.label', default: 'Section Label')}"/>

            <g:sortableColumn property="condition" title="${message(code: 'airfieldSurfaceStatus.condition.label', default: 'Condition')}"/>

            <g:sortableColumn property="notes" title="${message(code: 'airfieldSurfaceStatus.notes.label', default: 'Notes')}"/>

            <g:sortableColumn property="repairStatus" title="${message(code: 'airfieldSurfaceStatus.repairStatus.label', default: 'Repair Status')}"/>

            <g:sortableColumn property="lastUpdated" title="${message(code: 'airfieldSurfaceStatus.lastUpdated.label', default: 'Last Updated')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${airfieldSurfaceStatusList}" status="i" var="airfieldSurfaceStatus">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${airfieldSurfaceStatus.id}">${fieldValue(bean: airfieldSurfaceStatus, field: "airfieldName")}</g:link></td>

                <td>${fieldValue(bean: airfieldSurfaceStatus, field: "runway")}</td>

                <td>${fieldValue(bean: airfieldSurfaceStatus, field: "sectionLabel")}</td>

                <td>${fieldValue(bean: airfieldSurfaceStatus, field: "condition")}</td>

                <td>${fieldValue(bean: airfieldSurfaceStatus, field: "notes")}</td>

                <td>${fieldValue(bean: airfieldSurfaceStatus, field: "repairStatus")}</td>

                <td><g:formatDate timeZone="America/Denver"  date="${airfieldSurfaceStatus.lastUpdated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${airfieldSurfaceStatusCount ?: 0}"/>
    </div>
</div>
</body>
</html>
