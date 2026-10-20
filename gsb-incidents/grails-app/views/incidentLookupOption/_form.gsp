<div class="fieldcontain ${hasErrors(bean: incidentLookupOption, field: 'category', 'error')} required">
    <label for="category">
        <g:message code="incidentLookupOption.category.label" default="Category"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="category" maxlength="100" required="" value="${incidentLookupOption?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentLookupOption, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="incidentLookupOption.value.label" default="Dropdown Text"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="value" maxlength="255" required="" value="${incidentLookupOption?.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentLookupOption, field: 'sortOrder', 'error')}">
    <label for="sortOrder">
        <g:message code="incidentLookupOption.sortOrder.label" default="Sort Order"/>
    </label>
    <g:field name="sortOrder" type="number" value="${incidentLookupOption?.sortOrder}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentLookupOption, field: 'active', 'error')}">
    <label for="active">
        <g:message code="incidentLookupOption.active.label" default="Active"/>
    </label>
    <g:checkBox name="active" value="${incidentLookupOption?.active}"/>
</div>
