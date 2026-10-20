<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<a href="#show-incidentLookupOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>
<div id="show-incidentLookupOption" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list incidentLookupOption">
        <li class="fieldcontain"><span class="property-label">Category</span><span class="property-value">${fieldValue(bean: incidentLookupOption, field: 'category')}</span></li>
        <li class="fieldcontain"><span class="property-label">Dropdown Text</span><span class="property-value">${fieldValue(bean: incidentLookupOption, field: 'value')}</span></li>
        <li class="fieldcontain"><span class="property-label">Sort Order</span><span class="property-value">${fieldValue(bean: incidentLookupOption, field: 'sortOrder')}</span></li>
        <li class="fieldcontain"><span class="property-label">Active</span><span class="property-value">${incidentLookupOption.active ? 'Yes' : 'No'}</span></li>
    </ol>
    <g:form resource="${this.incidentLookupOption}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.incidentLookupOption}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
