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
    <title><g:fieldValue bean="${fireFightingAssets}" field="airfieldName"/> Fire Fighting <g:fieldValue bean="${fireFightingAssets}" field="itemName"/></title>
</head>

<body>
<a href="#show-fireFightingAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Fire Fighting Asset List</g:link></li>
        <li><g:link class="create" action="create">Add Fire Fighting Asset</g:link></li>
    </ul>
</div>

<div id="show-fireFightingAssets" class="content scaffold-show" role="main">
    <h1><g:fieldValue bean="${fireFightingAssets}" field="airfieldName"/> Fire Fighting <g:fieldValue bean="${fireFightingAssets}" field="itemName"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list fireFightingAssets">

        <g:if test="${fireFightingAssets?.airfieldName}">
            <li class="fieldcontain">
                <span id="airfieldName-label" class="property-label"><g:message code="fireFightingAssets.airfieldName.label" default="Airport"/></span>

                <span class="property-value" aria-labelledby="airfieldName-label"><g:fieldValue bean="${fireFightingAssets}" field="airfieldName"/></span>

            </li>
        </g:if>
        <g:if test="${fireFightingAssets?.serviceOwner}">
            <li class="fieldcontain">
                <span id="serviceOwner-label" class="property-label"><g:message code="fireFightingAssets.serviceOwner.label" default="Agency"/></span>

                <span class="property-value" aria-labelledby="serviceOwner-label"><g:fieldValue bean="${fireFightingAssets}" field="serviceOwner"/></span>

            </li>
        </g:if>
        <g:if test="${fireFightingAssets?.locationName}">
            <li class="fieldcontain">
                <span id="locationName-label" class="property-label"><g:message code="fireFightingAssets.locationName.label" default="Location Name"/></span>

                <span class="property-value" aria-labelledby="locationName-label"><g:fieldValue bean="${fireFightingAssets}" field="locationName"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.itemName}">
            <li class="fieldcontain">
                <span id="itemName-label" class="property-label"><g:message code="fireFightingAssets.itemName.label" default="Asset"/></span>

                <span class="property-value" aria-labelledby="itemName-label"><g:fieldValue bean="${fireFightingAssets}" field="itemName"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.utc}">
            <li class="fieldcontain">
                <span id="utc-label" class="property-label"><g:message code="fireFightingAssets.utc.label" default="UTC"/></span>

                <span class="property-value" aria-labelledby="utc-label"><g:fieldValue bean="${fireFightingAssets}" field="utc"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.nsn}">
            <li class="fieldcontain">
                <span id="nsn-label" class="property-label"><g:message code="fireFightingAssets.nsn.label" default="NSN"/></span>

                <span class="property-value" aria-labelledby="nsn-label"><g:fieldValue bean="${fireFightingAssets}" field="nsn"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.avai}">
            <li class="fieldcontain">
                <span id="avai-label" class="property-label"><g:message code="fireFightingAssets.avai.label" default="Available"/></span>

                <span class="property-value" aria-labelledby="avai-label"><g:fieldValue bean="${fireFightingAssets}" field="avai"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.auth}">
            <li class="fieldcontain">
                <span id="auth-label" class="property-label"><g:message code="fireFightingAssets.auth.label" default="Authorized"/></span>

                <span class="property-value" aria-labelledby="auth-label"><g:fieldValue bean="${fireFightingAssets}" field="auth"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.numShort > 0}">
            <li class="fieldcontain">
                <span id="numShort-label" class="property-label"><g:message code="fireFightingAssets.numShort.label" default="Shortfall"/></span>

                <span class="property-value" aria-labelledby="numShort-label"><g:fieldValue bean="${fireFightingAssets}" field="numShort"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.numExcess > 0}">
            <li class="fieldcontain">
                <span id="numExcess-label" class="property-label"><g:message code="fireFightingAssets.numExcess.label" default="Excess"/></span>

                <span class="property-value" aria-labelledby="numExcess-label"><g:fieldValue bean="${fireFightingAssets}" field="numExcess"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.auth}">
            <li class="fieldcontain">
                <span id="percentage-label" class="property-label"><g:message code="fireFightingAssets.percentage.label" default="Available %"/></span>


                <span class="property-value" aria-labelledby="percentage-label"><g:formatNumber number="${fireFightingAssets.percentage}" type="percent" minFractionDigits="0" roundingMode="HALF_UP"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.remarks}">
            <li class="fieldcontain">
                <span id="remarks-label" class="property-label"><g:message code="fireFightingAssets.remarks.label" default="Remarks"/></span>

                <span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${fireFightingAssets}" field="remarks"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.createdBy}">
            <li class="fieldcontain">
                <span id="createdBy-label" class="property-label"><g:message code="fireFightingAssets.createdBy.label" default="Created By"/></span>

                <span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${fireFightingAssets}" field="createdBy"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.editedBy}">
            <li class="fieldcontain">
                <span id="editedBy-label" class="property-label"><g:message code="fireFightingAssets.editedBy.label" default="Updated By"/></span>

                <span class="property-value" aria-labelledby="editedBy-label"><g:fieldValue bean="${fireFightingAssets}" field="editedBy"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="fireFightingAssets.dateCreated.label" default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate timeZone="America/Denver"  date="${fireFightingAssets?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${fireFightingAssets?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="fireFightingAssets.lastUpdated.label" default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"  date="${fireFightingAssets?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: fireFightingAssets, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${fireFightingAssets}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
            <sec:ifAnyGranted roles="ROLE_CE_ADMIN">
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAnyGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
