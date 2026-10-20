%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.FireFightingAssetsController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'fireFightingAssets.label', default: 'FireFightingAssets')}"/>
    <title><g:fieldValue bean="${fireFightingAssets}" field="airfieldName"/> Fire Fighting <g:fieldValue bean="${fireFightingAssets}" field="itemName"/></title>
</head>

<body>
<a href="#edit-fireFightingAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Fire Fighting Asset List</g:link></li>
        <li><g:link class="create" action="create">Add Fire Fighting Asset</g:link></li>
    </ul>
</div>

<div id="edit-fireFightingAssets" class="content scaffold-edit" role="main">
    <h1><g:fieldValue bean="${fireFightingAssets}" field="airfieldName"/> Fire Fighting <g:fieldValue bean="${fireFightingAssets}" field="itemName"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${fireFightingAssets}">
        <ul class="errors" role="alert">
            <g:eachError bean="${fireFightingAssets}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: fireFightingAssets, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${fireFightingAssets?.version}"/>
        <fieldset class="form">
            <g:render template="formedit"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
