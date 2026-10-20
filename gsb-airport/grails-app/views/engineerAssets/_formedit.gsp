%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.EngineerAssetsController" %>



<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'airfieldName', 'error')} ">
    <label for="airfieldName">
        <g:message code="engineerAssets.airfieldName.label" default="Base"/>

    </label>
    <airportLookup:select name="airfieldName"
                          category="asset.airfieldName"
                          value="${engineerAssets?.airfieldName}"
                          noSelection="['Other': 'Select Base....']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'serviceOwner', 'error')} ">
    <label for="serviceOwner">
        <g:message code="engineerAssets.serviceOwner.label" default="Agency"/>

    </label>
    <airportLookup:select name="serviceOwner"
                          category="asset.serviceOwner"
                          value="${engineerAssets?.serviceOwner}"
                          noSelection="['Other': 'Select Agency....']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'itemName', 'error')} ">
    <label for="itemName">
        <g:message code="engineerAssets.itemName.label" default="Asset"/>

    </label>
    <g:textField name="itemName" value="${engineerAssets?.itemName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'utc', 'error')} ">
    <label for="utc">
        <g:message code="engineerAssets.utc.label" default="UTC"/>

    </label>
    <g:textField name="utc" value="${engineerAssets?.utc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'nsn', 'error')} ">
    <label for="nsn">
        <g:message code="engineerAssets.nsn.label" default="NSN"/>

    </label>
    <g:textField name="nsn" value="${engineerAssets?.nsn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'avai', 'error')} required">
    <label for="avai">
        <g:message code="engineerAssets.avai.label" default="Available"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="avai" value="${fieldValue(bean: engineerAssets, field: 'avai')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'auth', 'error')} required">
    <label for="auth">
        <g:message code="engineerAssets.auth.label" default="Authorized"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="auth" value="${fieldValue(bean: engineerAssets, field: 'auth')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'remarks', 'error')} ">
    <label for="remarks">
        <g:message code="engineerAssets.remarks.label" default="Remarks"/>

    </label>
    <g:textArea name="remarks" value="${engineerAssets?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: engineerAssets, field: 'editedBy', 'error')} required">

    <g:hiddenField name="editedBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>
