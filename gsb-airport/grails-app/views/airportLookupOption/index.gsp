<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'airportLookupOption.label', default: 'Airport Lookup Option')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<a href="#list-airportLookupOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>
<div id="list-airportLookupOption" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="category" title="${message(code: 'airportLookupOption.category.label', default: 'Category')}"/>
            <g:sortableColumn property="value" title="${message(code: 'airportLookupOption.value.label', default: 'Dropdown Text')}"/>
            <g:sortableColumn property="sortOrder" title="${message(code: 'airportLookupOption.sortOrder.label', default: 'Sort Order')}"/>
            <g:sortableColumn property="active" title="${message(code: 'airportLookupOption.active.label', default: 'Active')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${airportLookupOptionList}" status="i" var="airportLookupOption">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${airportLookupOption.id}">${fieldValue(bean: airportLookupOption, field: 'category')}</g:link></td>
                <td>${fieldValue(bean: airportLookupOption, field: 'value')}</td>
                <td>${fieldValue(bean: airportLookupOption, field: 'sortOrder')}</td>
                <td>${airportLookupOption.active ? 'Yes' : 'No'}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${airportLookupOptionCount ?: 0}"/>
    </div>
</div>
</body>
</html>
