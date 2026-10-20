%{--
  - 2017 6 23 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.CurrentSITController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'currentSIT.label', default: 'CurrentSIT')}"/>
    <title>CE <g:fieldValue bean="${currentSIT}" field="airfieldName"/></title>
</head>

<body>
<a href="#show-currentSIT" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/CurrentSIT/index?sort=airfieldName&max=100&order=asc')}">CE Dashboard Overall</a></li>
    </ul>
</div>

<div id="show-currentSIT" class="content scaffold-show" role="main">
    <h1>CE DASHBOARD</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <tbody>
        <td id="engOffAvai-label" class="property-label2"><g:message code="personnel.engOffAvai.label" default="Status"/></td>
        </tbody>
    </table>
    <fieldset class="form">
        <g:render template="showtableone"/>
    </fieldset>
    <hr>
    <table>
        <tbody>
        <td id="engOffAvai-label" class="property-label3"><g:message code="personnel.engOffAvai.label" default=" "/></td>
        </tbody>
    </table>
    <table>
        <tbody>

        <g:if test="${currentSIT?.remarks}">

            <td id="remarks-label" class="property-label3"><g:message code="currentSIT.remarks.label" default="Remarks"/></td>

            <td class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${currentSIT}" field="remarks"/></td>

        </g:if>

        %{--<g:if test="${currentSIT?.mapit}">--}%

        %{--<td id="mapit-label" class="property-label3"><g:message code="currentSIT.mapit.label" default="Mapit"/></td>--}%

        %{--<td class="property-value" aria-labelledby="mapit-label"><g:fieldValue bean="${currentSIT}" field="mapit"/></td>--}%

        %{--</g:if>--}%

        <g:if test="${currentSIT?.cedUpdatedBy}">
            <li class="fieldcontain">
                <span id="cedUpdatedBy-label" class="property-label"><g:message code="currentSIT.cedUpdatedBy.label" default="CE Dashboard Updated By"/></span>

                <span class="property-value" aria-labelledby="cedUpdatedBy-label"><g:fieldValue bean="${currentSIT}" field="cedUpdatedBy"/></span>

            </li>
        </g:if>

        <g:if test="${currentSIT?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="currentSIT.lastUpdated.label" default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"  date="${currentSIT?.lastUpdated}"/></span>

            </li>
        </g:if>

        </tbody>
    </table>
    <g:form url="[resource: currentSIT, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${currentSIT}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>

</div>
</body>
</html>
