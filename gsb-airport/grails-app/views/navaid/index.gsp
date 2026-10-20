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
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-navaid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-navaid" class="content scaffold-list" role="main">
    <h1>NAVAID List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="airfieldName" title="${message(code: 'navaid.airfieldName.label', default: 'Airport')}"/>

            <g:sortableColumn property="owner" title="${message(code: 'navaid.owner.label', default: 'Owner')}"/>

            <g:sortableColumn property="navaidName" title="${message(code: 'navaid.navaidName.label', default: 'NAVAID Name')}"/>

            <g:sortableColumn property="navaidType" title="${message(code: 'navaid.navaidType.label', default: 'NAVAID Type')}"/>

            <g:sortableColumn property="status" title="${message(code: 'navaid.status.label', default: 'Status')}"/>

            <g:sortableColumn property="statusNote" title="${message(code: 'navaid.statusNote.label', default: 'Status Note')}"/>

            <g:sortableColumn property="lastUpdated" title="${message(code: 'navaid.lastUpdated.label', default: 'Last Updated')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${navaidList}" status="i" var="navaid">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${navaid.id}">${fieldValue(bean: navaid, field: "airfieldName")}</g:link></td>

                <td>${fieldValue(bean: navaid, field: "owner")}</td>

                <td>${fieldValue(bean: navaid, field: "navaidName")}</td>

                <td>${fieldValue(bean: navaid, field: "navaidType")}</td>

                <td>${fieldValue(bean: navaid, field: "status")}</td>

                <td>${fieldValue(bean: navaid, field: "statusNote")}</td>

                <td><g:formatDate timeZone="America/Denver"  date="${navaid.lastUpdated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${navaidCount ?: 0}"/>
    </div>
</div>
</body>
</html>
