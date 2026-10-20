<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'incidentLookupOption.label', default: 'Incident Lookup Option')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<a href="#list-incidentLookupOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>
<div id="list-incidentLookupOption" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="category" title="${message(code: 'incidentLookupOption.category.label', default: 'Category')}"/>
            <g:sortableColumn property="value" title="${message(code: 'incidentLookupOption.value.label', default: 'Dropdown Text')}"/>
            <g:sortableColumn property="sortOrder" title="${message(code: 'incidentLookupOption.sortOrder.label', default: 'Sort Order')}"/>
            <g:sortableColumn property="active" title="${message(code: 'incidentLookupOption.active.label', default: 'Active')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${incidentLookupOptionList}" status="i" var="incidentLookupOption">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${incidentLookupOption.id}">${fieldValue(bean: incidentLookupOption, field: 'category')}</g:link></td>
                <td>${fieldValue(bean: incidentLookupOption, field: 'value')}</td>
                <td>${fieldValue(bean: incidentLookupOption, field: 'sortOrder')}</td>
                <td>${incidentLookupOption.active ? 'Yes' : 'No'}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${incidentLookupOptionCount ?: 0}"/>
    </div>
</div>
</body>
</html>
