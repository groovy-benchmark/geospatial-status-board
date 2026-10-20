%{--
  - 2017 6 22 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.Navaid" %>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'airfieldName', 'error')} ">
    <label for="airfieldName">
        <g:message code="navaid.airfieldName.label" default="Airport"/>

    </label>
    <g:textField name="airfieldName" value="${navaid?.airfieldName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'owner', 'error')} ">
    <label for="owner">
        <g:message code="navaid.owner.label" default="Owner"/>

    </label>
    <g:textField name="owner" value="${navaid?.owner}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'navaidName', 'error')} ">
    <label for="navaidName">
        <g:message code="navaid.navaidName.label" default="NAVAID Name"/>

    </label>
    <g:textField name="navaidName" value="${navaid?.navaidName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'navaidType', 'error')} ">
    <label for="navaidType">
        <g:message code="navaid.navaidType.label" default="NAVAID Type"/>

    </label>
    <g:textField name="navaidType" value="${navaid?.navaidType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'status', 'error')} ">
    <label for="status">
        <g:message code="navaid.status.label" default="Status"/>

    </label>
    <airportLookup:select name="status" category="navaid.status" value="${navaid?.status}" valueMessagePrefix="navaid.status" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'statusNote', 'error')} ">
    <label for="statusNote">
        <g:message code="navaid.statusNote.label" default="Status Note"/>

    </label>
    <g:textArea name="statusNote" value="${navaid?.statusNote}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navaid, field: 'updatedBy', 'error')} required">

    <g:hiddenField name="updatedBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>