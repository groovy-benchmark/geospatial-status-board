%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.EngineerAssetsController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'engineerAssets.label', default: 'EngineerAssets')}"/>
    <title><g:fieldValue bean="${engineerAssets}" field="airfieldName"/> Engineer <g:fieldValue bean="${engineerAssets}" field="itemName"/></title>
</head>

<body>
<a href="#edit-engineerAssets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Engineer Asset List</g:link></li>
        <li><g:link class="create" action="create">Add Engineer Asset</g:link></li>
    </ul>
</div>

<div id="edit-engineerAssets" class="content scaffold-edit" role="main">
    <h1><g:fieldValue bean="${engineerAssets}" field="airfieldName"/> Engineer <g:fieldValue bean="${engineerAssets}" field="itemName"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${engineerAssets}">
        <ul class="errors" role="alert">
            <g:eachError bean="${engineerAssets}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: engineerAssets, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${engineerAssets?.version}"/>
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
