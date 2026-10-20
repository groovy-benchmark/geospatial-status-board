%{--
  - 2017 6 23 - Mission Command Dev Team
  -
  --}%

<%@ page import="gsb.airport.CurrentSITController" %>



<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'ceoverall', 'error')} required">
    <label for="ceoverall">
        <g:message code="currentSIT.ceoverall.label" default="CE Overall Assessment"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="ceoverall" category="currentSit.status" required="" value="${currentSIT?.ceoverall}" valueMessagePrefix="currentSIT.ceoverall"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'runway', 'error')} required">
    <label for="runway">
        <g:message code="currentSIT.runway.label" default="Pri Runway"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="runway" category="currentSit.status" required="" value="${currentSIT?.runway}" valueMessagePrefix="currentSIT.runway"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'runwaytwo', 'error')} required">
    <label for="runwaytwo">
        <g:message code="currentSIT.runwaytwo.label" default="Sec Runway"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="runwaytwo" category="currentSit.status" required="" value="${currentSIT?.runwaytwo}" valueMessagePrefix="currentSIT.runwaytwo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'airfield', 'error')} required">
    <label for="airfield">
        <g:message code="currentSIT.airfield.label" default="Airfield"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="airfield" category="currentSit.status" required="" value="${currentSIT?.airfield}" valueMessagePrefix="currentSIT.airfield"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'facilities', 'error')} required">
    <label for="facilities">
        <g:message code="currentSIT.facilities.label" default="Facilities"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="facilities" category="currentSit.status" required="" value="${currentSIT?.facilities}" valueMessagePrefix="currentSIT.facilities"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'utilities', 'error')} required">
    <label for="utilities">
        <g:message code="currentSIT.utilities.label" default="Utilities"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="utilities" category="currentSit.status" required="" value="${currentSIT?.utilities}" valueMessagePrefix="currentSIT.utilities"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'emerresp', 'error')} required">
    <label for="emerresp">
        <g:message code="currentSIT.emerresp.label" default="Emergency Response"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="emerresp" category="currentSit.status" required="" value="${currentSIT?.emerresp}" valueMessagePrefix="currentSIT.emerresp"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'nbcipe', 'error')} required">
    <label for="nbcipe">
        <g:message code="currentSIT.nbcipe.label" default="NBC IPE"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="nbcipe" category="currentSit.status" required="" value="${currentSIT?.nbcipe}" valueMessagePrefix="currentSIT.nbcipe"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'overpersonnel', 'error')} required">
    <label for="overpersonnel">
        <g:message code="currentSIT.overpersonnel.label" default="Personnel Overall"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="overpersonnel" category="currentSit.status" required="" value="${currentSIT?.overpersonnel}" valueMessagePrefix="currentSIT.overpersonnel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'firepersonnel', 'error')} required">
    <label for="firepersonnel">
        <g:message code="currentSIT.firepersonnel.label" default="Fire Personnel"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="firepersonnel" category="currentSit.status" required="" value="${currentSIT?.firepersonnel}" valueMessagePrefix="currentSIT.firepersonnel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'eodpersonnel', 'error')} required">
    <label for="eodpersonnel">
        <g:message code="currentSIT.eodpersonnel.label" default="EOD Personnel"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="eodpersonnel" category="currentSit.status" required="" value="${currentSIT?.eodpersonnel}" valueMessagePrefix="currentSIT.eodpersonnel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'nbcpersonnel', 'error')} required">
    <label for="nbcpersonnel">
        <g:message code="currentSIT.nbcpersonnel.label" default="CBRN Personnel"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="nbcpersonnel" category="currentSit.status" required="" value="${currentSIT?.nbcpersonnel}" valueMessagePrefix="currentSIT.nbcpersonnel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'engpersonnel', 'error')} required">
    <label for="engpersonnel">
        <g:message code="currentSIT.engpersonnel.label" default="Engineer Personnel"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="engpersonnel" category="currentSit.status" required="" value="${currentSIT?.engpersonnel}" valueMessagePrefix="currentSIT.engpersonnel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'overassets', 'error')} required">
    <label for="overassets">
        <g:message code="currentSIT.overassets.label" default="Assets Overall"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="overassets" category="currentSit.status" required="" value="${currentSIT?.overassets}" valueMessagePrefix="currentSIT.overassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'fireassets', 'error')} required">
    <label for="fireassets">
        <g:message code="currentSIT.fireassets.label" default="Fire Assets"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="fireassets" category="currentSit.status" required="" value="${currentSIT?.fireassets}" valueMessagePrefix="currentSIT.fireassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'eodassets', 'error')} required">
    <label for="eodassets">
        <g:message code="currentSIT.eodassets.label" default="EOD Assets"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="eodassets" category="currentSit.status" required="" value="${currentSIT?.eodassets}" valueMessagePrefix="currentSIT.eodassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'nbcassets', 'error')} required">
    <label for="nbcassets">
        <g:message code="currentSIT.nbcassets.label" default="CBRN Assets"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="nbcassets" category="currentSit.status" required="" value="${currentSIT?.nbcassets}" valueMessagePrefix="currentSIT.nbcassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'engassets', 'error')} required">
    <label for="engassets">
        <g:message code="currentSIT.engassets.label" default="Engineer Assets"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="engassets" category="currentSit.status" required="" value="${currentSIT?.engassets}" valueMessagePrefix="currentSIT.engassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'snowassets', 'error')} required">
    <label for="snowassets">
        <g:message code="currentSIT.snowassets.label" default="Snow Removal Assets"/>
        <span class="required-indicator">*</span>
    </label>
    <airportLookup:select name="snowassets" category="currentSit.status" required="" value="${currentSIT?.snowassets}" valueMessagePrefix="currentSIT.snowassets"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'remarks', 'error')} ">
    <label for="remarks">
        <g:message code="currentSIT.remarks.label" default="Remarks"/>

    </label>
    <g:textArea name="remarks" cols="40" rows="5" maxlength="10000" value="${currentSIT?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currentSIT, field: 'cedUpdatedBy', 'error')} required">

    <g:hiddenField name="cedUpdatedBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>
