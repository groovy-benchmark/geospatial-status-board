<div class="fieldcontain ${hasErrors(bean: airportLookupOption, field: 'category', 'error')} required">
    <label for="category">
        <g:message code="airportLookupOption.category.label" default="Category"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="category" maxlength="100" required="" value="${airportLookupOption?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airportLookupOption, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="airportLookupOption.value.label" default="Dropdown Text"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="value" maxlength="255" required="" value="${airportLookupOption?.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airportLookupOption, field: 'sortOrder', 'error')}">
    <label for="sortOrder">
        <g:message code="airportLookupOption.sortOrder.label" default="Sort Order"/>
    </label>
    <g:field name="sortOrder" type="number" value="${airportLookupOption?.sortOrder}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airportLookupOption, field: 'active', 'error')}">
    <label for="active">
        <g:message code="airportLookupOption.active.label" default="Active"/>
    </label>
    <g:checkBox name="active" value="${airportLookupOption?.active}"/>
</div>
