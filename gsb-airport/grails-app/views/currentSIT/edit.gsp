%{--
  - 2017 6 23 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.CurrentSITController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'currentSIT.label', default: 'CurrentSIT')}"/>
    <title>CE STATUS <g:fieldValue bean="${currentSIT}" field="airfieldName"/></title>
</head>

<body>
<a href="#edit-currentSIT" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>

    </ul>
</div>

<div id="edit-currentSIT" class="content scaffold-edit" role="main">
    <h1>CE STATUS <g:fieldValue bean="${currentSIT}" field="airfieldName"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${currentSIT}">
        <ul class="errors" role="alert">
            <g:eachError bean="${currentSIT}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: currentSIT, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${currentSIT?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
