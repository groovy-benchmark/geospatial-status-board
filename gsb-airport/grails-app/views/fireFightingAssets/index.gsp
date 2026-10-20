%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.FireFightingAssetsController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'fireFightingAssets.label', default: 'FireFightingAssets')}"/>
    <title>Fire Fighting Asset List</title>
</head>

<body>
<a href="#list-fireFightingAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create">Add Fire Fighting Asset</g:link></li>
    </ul>
</div>

<div id="list-fireFightingAssets" class="content scaffold-list" role="main">
    <h1>Fire Fighting Asset List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="airfieldName" title="${message(code: 'fireFightingAssets.airfieldName.label', default: 'Base')}"/>
            <g:sortableColumn property="itemName" title="${message(code: 'fireFightingAssets.itemName.label', default: 'Asset')}"/>
            <g:sortableColumn property="serviceOwner" title="${message(code: 'fireFightingAssets.serviceOwner.label', default: 'Agency')}"/>
            <g:sortableColumn property="utc" title="${message(code: 'fireFightingAssets.utc.label', default: 'UTC')}"/>
            <g:sortableColumn property="nsn" title="${message(code: 'fireFightingAssets.nsn.label', default: 'NSN')}"/>
            <g:sortableColumn property="avai" title="${message(code: 'fireFightingAssets.avai.label', default: 'Available')}"/>
            <g:sortableColumn property="auth" title="${message(code: 'fireFightingAssets.auth.label', default: 'Authorized')}"/>
            <g:sortableColumn property="numShort" title="${message(code: 'fireFightingAssets.numShort.label', default: 'Shortfall')}"/>
            <g:sortableColumn property="numExcess" title="${message(code: 'fireFightingAssets.numExcess.label', default: 'Excess')}"/>
            <g:sortableColumn property="percentage" title="${message(code: 'fireFightingAssets.percentage.label', default: 'Available %')}"/>
            <th>Remarks</th>
            <g:sortableColumn property="lastUpdated" title="${message(code: 'fireFightingAssets.lastUpdated.label', default: 'Updated')}"/>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${fireFightingAssetsList}" status="i" var="fireFightingAssets">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${fireFightingAssets.id}">${fieldValue(bean: fireFightingAssets, field: "airfieldName")}</g:link></td>
                <td>${fieldValue(bean: fireFightingAssets, field: "itemName")}</td>
                <td>${fieldValue(bean: fireFightingAssets, field: "serviceOwner")}</td>
                <td>${fieldValue(bean: fireFightingAssets, field: "utc")}</td>
                <td>${fieldValue(bean: fireFightingAssets, field: "nsn")}</td>
                <td>${fieldValue(bean: fireFightingAssets, field: "avai")}</td>
                <td>${fieldValue(bean: fireFightingAssets, field: "auth")}</td>
                <td>
                    <g:if test="${fireFightingAssets?.numShort > 0}">
                        ${fieldValue(bean: fireFightingAssets, field: "numShort")}
                    </g:if>
                </td>
                <td>
                    <g:if test="${fireFightingAssets?.numExcess > 0}">
                        ${fieldValue(bean: fireFightingAssets, field: "numExcess")}
                    </g:if>
                </td>
                <td><g:formatNumber number="${fireFightingAssets.percentage}" type="percent" minFractionDigits="0"
                                    roundingMode="HALF_UP"/></td>
                <td>${fieldValue(bean: fireFightingAssets, field: "remarks")}</td>
                <td><g:formatDate timeZone="America/Denver" format="dd MMM HH:mm" date="${fireFightingAssets.lastUpdated}"/></td>
                <td class="buttonstd"><g:link action="edit" target="_blank" id="${fireFightingAssets.id}">EDIT</g:link></td>
                <td class="buttonstd"><g:link action="show" id="${fireFightingAssets.id}">VIEW</g:link></td>
            </tr>
        </g:each>
        </tbody>
        <thead>
        <tr>
            <g:sortableColumn property="airfieldName" title="${message(code: 'fireFightingAssets.airfieldName.label', default: 'Base')}"/>
            <g:sortableColumn property="itemName" title="${message(code: 'fireFightingAssets.itemName.label', default: 'Asset')}"/>
            <g:sortableColumn property="serviceOwner" title="${message(code: 'fireFightingAssets.serviceOwner.label', default: 'Agency')}"/>
            <g:sortableColumn property="utc" title="${message(code: 'fireFightingAssets.utc.label', default: 'UTC')}"/>
            <g:sortableColumn property="nsn" title="${message(code: 'fireFightingAssets.nsn.label', default: 'NSN')}"/>
            <g:sortableColumn property="avai" title="${message(code: 'fireFightingAssets.avai.label', default: 'Available')}"/>
            <g:sortableColumn property="auth" title="${message(code: 'fireFightingAssets.auth.label', default: 'Authorized')}"/>
            <g:sortableColumn property="numShort" title="${message(code: 'fireFightingAssets.numShort.label', default: 'Shortfall')}"/>
            <g:sortableColumn property="numExcess" title="${message(code: 'fireFightingAssets.numExcess.label', default: 'Excess')}"/>
            <g:sortableColumn property="percentage" title="${message(code: 'fireFightingAssets.percentage.label', default: 'Available %')}"/>
            <th>Remarks</th>
            <g:sortableColumn property="lastUpdated" title="${message(code: 'fireFightingAssets.lastUpdated.label', default: 'Updated')}"/>
            <th></th>
            <th></th>
        </tr>
        </thead>
    </table>

    <div class="pagination">
        <g:paginate total="${fireFightingAssetsCount ?: 0}"/>
    </div>
</div>
</body>
</html>
