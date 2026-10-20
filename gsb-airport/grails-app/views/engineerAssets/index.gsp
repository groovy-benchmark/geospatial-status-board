%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.EngineerAssetsController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'engineerAssets.label', default: 'EngineerAssets')}"/>
    <title>Engineer Asset List</title>
</head>

<body>
<a href="#list-engineerAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create">Add Engineer Asset</g:link></li>
    </ul>
</div>

<div id="list-engineerAssets" class="content scaffold-list" role="main">
    <h1>Engineer Asset List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="airfieldName" title="${message(code: 'engineerAssets.airfieldName.label', default: 'Base')}"/>
            <g:sortableColumn property="itemName" title="${message(code: 'engineerAssets.itemName.label', default: 'Asset')}"/>
            <g:sortableColumn property="serviceOwner" title="${message(code: 'engineerAssets.serviceOwner.label', default: 'Agency')}"/>
            <g:sortableColumn property="utc" title="${message(code: 'engineerAssets.utc.label', default: 'UTC')}"/>
            <g:sortableColumn property="nsn" title="${message(code: 'engineerAssets.nsn.label', default: 'NSN')}"/>
            <g:sortableColumn property="avai" title="${message(code: 'engineerAssets.avai.label', default: 'Available')}"/>
            <g:sortableColumn property="auth" title="${message(code: 'engineerAssets.auth.label', default: 'Authorized')}"/>
            <g:sortableColumn property="numShort" title="${message(code: 'engineerAssets.numShort.label', default: 'Shortfall')}"/>
            <g:sortableColumn property="numExcess" title="${message(code: 'engineerAssets.numExcess.label', default: 'Excess')}"/>
            <g:sortableColumn property="percentage" title="${message(code: 'engineerAssets.percentage.label', default: 'Available %')}"/>
            <th>Remarks</th>
            <g:sortableColumn property="lastUpdated" title="${message(code: 'engineerAssets.lastUpdated.label', default: 'Updated')}"/>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${engineerAssetsList}" status="i" var="engineerAssets">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${engineerAssets.id}">${fieldValue(bean: engineerAssets, field: "airfieldName")}</g:link></td>
                <td>${fieldValue(bean: engineerAssets, field: "itemName")}</td>
                <td>${fieldValue(bean: engineerAssets, field: "serviceOwner")}</td>
                <td>${fieldValue(bean: engineerAssets, field: "utc")}</td>
                <td>${fieldValue(bean: engineerAssets, field: "nsn")}</td>
                <td>${fieldValue(bean: engineerAssets, field: "avai")}</td>
                <td>${fieldValue(bean: engineerAssets, field: "auth")}</td>
                <td>
                    <g:if test="${engineerAssets?.numShort > 0}">
                        ${fieldValue(bean: engineerAssets, field: "numShort")}
                    </g:if>
                </td>
                <td>
                    <g:if test="${engineerAssets?.numExcess > 0}">
                        ${fieldValue(bean: engineerAssets, field: "numExcess")}
                    </g:if>
                </td>
                <td><g:formatNumber number="${engineerAssets.percentage}" type="percent" minFractionDigits="0"
                                    roundingMode="HALF_UP"/></td>
                <td>${fieldValue(bean: engineerAssets, field: "remarks")}</td>
                <td><g:formatDate timeZone="America/Denver" format="dd MMM HH:mm" date="${engineerAssets.lastUpdated}"/></td>
                <td class="buttonstd"><g:link action="edit" target="_blank" id="${engineerAssets.id}">EDIT</g:link></td>
                <td class="buttonstd"><g:link action="show" id="${engineerAssets.id}">VIEW</g:link></td>
            </tr>
        </g:each>
        </tbody>
        <thead>
        <tr>
            <g:sortableColumn property="airfieldName" title="${message(code: 'engineerAssets.airfieldName.label', default: 'Base')}"/>
            <g:sortableColumn property="itemName" title="${message(code: 'engineerAssets.itemName.label', default: 'Asset')}"/>
            <g:sortableColumn property="serviceOwner" title="${message(code: 'engineerAssets.serviceOwner.label', default: 'Agency')}"/>
            <g:sortableColumn property="utc" title="${message(code: 'engineerAssets.utc.label', default: 'UTC')}"/>
            <g:sortableColumn property="nsn" title="${message(code: 'engineerAssets.nsn.label', default: 'NSN')}"/>
            <g:sortableColumn property="avai" title="${message(code: 'engineerAssets.avai.label', default: 'Available')}"/>
            <g:sortableColumn property="auth" title="${message(code: 'engineerAssets.auth.label', default: 'Authorized')}"/>
            <g:sortableColumn property="numShort" title="${message(code: 'engineerAssets.numShort.label', default: 'Shortfall')}"/>
            <g:sortableColumn property="numExcess" title="${message(code: 'engineerAssets.numExcess.label', default: 'Excess')}"/>
            <g:sortableColumn property="percentage" title="${message(code: 'engineerAssets.percentage.label', default: 'Available %')}"/>
            <th>Remarks</th>
            <g:sortableColumn property="lastUpdated" title="${message(code: 'engineerAssets.lastUpdated.label', default: 'Updated')}"/>
            <th></th>
            <th></th>
        </tr>
        </thead>
    </table>

    <div class="pagination">
        <g:paginate total="${engineerAssetsCount ?: 0}"/>
    </div>
</div>
</body>
</html>
