%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.FireFightingAssetsController" %>



<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'airfieldName', 'error')} ">
    <label for="airfieldName">
        <g:message code="fireFightingAssets.airfieldName.label" default="Base"/>

    </label>
    <airportLookup:select name="airfieldName"
                          category="asset.airfieldName"
                          value="${fireFightingAssets?.airfieldName}"
                          noSelection="['Other': 'Select Base....']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'serviceOwner', 'error')} ">
    <label for="serviceOwner">
        <g:message code="fireFightingAssets.serviceOwner.label" default="Agency"/>

    </label>
    <airportLookup:select name="serviceOwner"
                          category="asset.serviceOwner"
                          value="${fireFightingAssets?.serviceOwner}"
                          noSelection="['Other': 'Select Agency....']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'itemName', 'error')} ">
    <label for="itemName">
        <g:message code="fireFightingAssets.itemName.label" default="Asset"/>

    </label>
    <g:textField name="itemName" value="${fireFightingAssets?.itemName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'utc', 'error')} ">
    <label for="utc">
        <g:message code="fireFightingAssets.utc.label" default="UTC"/>

    </label>
    <g:textField name="utc" value="${fireFightingAssets?.utc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'nsn', 'error')} ">
    <label for="nsn">
        <g:message code="fireFightingAssets.nsn.label" default="NSN"/>

    </label>
    <g:textField name="nsn" value="${fireFightingAssets?.nsn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'avai', 'error')} required">
    <label for="avai">
        <g:message code="fireFightingAssets.avai.label" default="Available"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="avai" value="${fieldValue(bean: fireFightingAssets, field: 'avai')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'auth', 'error')} required">
    <label for="auth">
        <g:message code="fireFightingAssets.auth.label" default="Authorized"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="auth" value="${fieldValue(bean: fireFightingAssets, field: 'auth')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'remarks', 'error')} ">
    <label for="remarks">
        <g:message code="fireFightingAssets.remarks.label" default="Remarks"/>

    </label>
    <g:textArea name="remarks" value="${fireFightingAssets?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fireFightingAssets, field: 'createdBy', 'error')} required">

    <g:hiddenField name="createdBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>
