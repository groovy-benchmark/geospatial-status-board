%{--
  - 2017 6 12 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.AirfieldSurfaceStatusController" %>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'airfieldName', 'error')} ">
    <label for="airfieldName">
        <g:message code="airfieldSurfaceStatus.airfieldName.label" default="Airfield Name"/>

    </label>
    <g:textField name="airfieldName" value="${airfieldSurfaceStatus?.airfieldName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'runway', 'error')} ">
    <label for="runway">
        <g:message code="airfieldSurfaceStatus.runway.label" default="Runway"/>

    </label>
    <g:textField name="runway" value="${airfieldSurfaceStatus?.runway}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'sectionLabel', 'error')} ">
    <label for="sectionLabel">
        <g:message code="airfieldSurfaceStatus.sectionLabel.label" default="Section Label"/>

    </label>
    <g:textField name="sectionLabel" value="${airfieldSurfaceStatus?.sectionLabel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'condition', 'error')} ">
    <label for="condition">
        <g:message code="airfieldSurfaceStatus.condition.label" default="Condition"/>

    </label>
    <airportLookup:select name="condition" category="airfieldSurface.condition" value="${airfieldSurfaceStatus?.condition}" valueMessagePrefix="airfieldSurfaceStatus.condition" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'notes', 'error')} ">
    <label for="notes">
        <g:message code="airfieldSurfaceStatus.notes.label" default="Notes"/>

    </label>
    <g:textArea name="notes" value="${airfieldSurfaceStatus?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'repairStatus', 'error')} ">
    <label for="repairStatus">
        <g:message code="airfieldSurfaceStatus.repairStatus.label" default="Repair Status"/>

    </label>
    <g:textField name="repairStatus" value="${airfieldSurfaceStatus?.repairStatus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airfieldSurfaceStatus, field: 'updatedBy', 'error')} required">

    <g:hiddenField name="updatedBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>