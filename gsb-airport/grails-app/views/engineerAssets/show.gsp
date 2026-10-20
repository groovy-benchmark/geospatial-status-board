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
    <g:set var="entityName" value="${message(code: 'engineerAssets.label', default: 'Engineer Assets')}"/>
    <title><g:fieldValue bean="${engineerAssets}" field="airfieldName"/> Engineer <g:fieldValue
            bean="${engineerAssets}" field="itemName"/></title>
</head>

<body>
<a href="#show-engineerAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Engineer Asset List</g:link></li>
        <li><g:link class="create" action="create">Add Engineer Asset</g:link></li>
    </ul>
</div>

<div id="show-engineerAssets" class="content scaffold-show" role="main">
    <h1><g:fieldValue bean="${engineerAssets}" field="airfieldName"/> Engineer <g:fieldValue
            bean="${engineerAssets}" field="itemName"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list engineerAssets">

        <g:if test="${engineerAssets?.airfieldName}">
            <li class="fieldcontain">
                <span id="airfieldName-label" class="property-label"><g:message
                        code="engineerAssets.airfieldName.label" default="Airport"/></span>

                <span class="property-value" aria-labelledby="airfieldName-label"><g:fieldValue
                        bean="${engineerAssets}" field="airfieldName"/></span>

            </li>
        </g:if>
        <g:if test="${engineerAssets?.serviceOwner}">
            <li class="fieldcontain">
                <span id="serviceOwner-label" class="property-label"><g:message code="engineerAssets.serviceOwner.label"
                                                                                default="Agency"/></span>

                <span class="property-value" aria-labelledby="serviceOwner-label"><g:fieldValue
                        bean="${engineerAssets}" field="serviceOwner"/></span>

            </li>
        </g:if>
        <g:if test="${engineerAssets?.locationName}">
            <li class="fieldcontain">
                <span id="locationName-label" class="property-label"><g:message code="engineerAssets.locationName.label"
                                                                                default="Location Name"/></span>

                <span class="property-value" aria-labelledby="locationName-label"><g:fieldValue
                        bean="${engineerAssets}" field="locationName"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.itemName}">
            <li class="fieldcontain">
                <span id="itemName-label" class="property-label"><g:message code="engineerAssets.itemName.label"
                                                                            default="Asset"/></span>

                <span class="property-value" aria-labelledby="itemName-label"><g:fieldValue
                        bean="${engineerAssets}" field="itemName"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.utc}">
            <li class="fieldcontain">
                <span id="utc-label" class="property-label"><g:message code="engineerAssets.utc.label"
                                                                       default="UTC"/></span>

                <span class="property-value" aria-labelledby="utc-label"><g:fieldValue bean="${engineerAssets}"
                                                                                       field="utc"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.nsn}">
            <li class="fieldcontain">
                <span id="nsn-label" class="property-label"><g:message code="engineerAssets.nsn.label"
                                                                       default="NSN"/></span>

                <span class="property-value" aria-labelledby="nsn-label"><g:fieldValue bean="${engineerAssets}"
                                                                                       field="nsn"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.avai}">
            <li class="fieldcontain">
                <span id="avai-label" class="property-label"><g:message code="engineerAssets.avai.label"
                                                                        default="Available"/></span>

                <span class="property-value" aria-labelledby="avai-label"><g:fieldValue bean="${engineerAssets}"
                                                                                        field="avai"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.auth}">
            <li class="fieldcontain">
                <span id="auth-label" class="property-label"><g:message code="engineerAssets.auth.label"
                                                                        default="Authorized"/></span>

                <span class="property-value" aria-labelledby="auth-label"><g:fieldValue bean="${engineerAssets}"
                                                                                        field="auth"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.numShort > 0}">
            <li class="fieldcontain">
                <span id="numShort-label" class="property-label"><g:message code="engineerAssets.numShort.label"
                                                                            default="Shortfall"/></span>

                <span class="property-value" aria-labelledby="numShort-label"><g:fieldValue
                        bean="${engineerAssets}" field="numShort"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.numExcess > 0}">
            <li class="fieldcontain">
                <span id="numExcess-label" class="property-label"><g:message code="engineerAssets.numExcess.label"
                                                                             default="Excess"/></span>

                <span class="property-value" aria-labelledby="numExcess-label"><g:fieldValue
                        bean="${engineerAssets}" field="numExcess"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.auth}">
            <li class="fieldcontain">
                <span id="percentage-label" class="property-label"><g:message code="engineerAssets.percentage.label"
                                                                              default="Available %"/></span>

                <span class="property-value" aria-labelledby="percentage-label"><g:formatNumber
                        number="${engineerAssets.percentage}" type="percent" minFractionDigits="0"
                        roundingMode="HALF_UP"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.remarks}">
            <li class="fieldcontain">
                <span id="remarks-label" class="property-label"><g:message code="engineerAssets.remarks.label"
                                                                           default="Remarks"/></span>

                <span class="property-value" aria-labelledby="remarks-label"><g:fieldValue
                        bean="${engineerAssets}" field="remarks"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.createdBy}">
            <li class="fieldcontain">
                <span id="createdBy-label" class="property-label"><g:message code="engineerAssets.createdBy.label"
                                                                             default="Created By"/></span>

                <span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue
                        bean="${engineerAssets}" field="createdBy"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.editedBy}">
            <li class="fieldcontain">
                <span id="editedBy-label" class="property-label"><g:message code="engineerAssets.editedBy.label"
                                                                            default="Updated By"/></span>

                <span class="property-value" aria-labelledby="editedBy-label"><g:fieldValue
                        bean="${engineerAssets}" field="editedBy"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="engineerAssets.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate timeZone="America/Denver"
                        date="${engineerAssets?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${engineerAssets?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="engineerAssets.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"
                        date="${engineerAssets?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: engineerAssets, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${engineerAssets}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <sec:ifAnyGranted roles="ROLE_CE_ADMIN">
                <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAnyGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
