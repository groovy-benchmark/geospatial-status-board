<%@ page import="gsb.airport.AirportStatusController" %>


<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'airfieldName', 'error')} ">
    <label for="airfieldName">
        <g:message code="airportStatus.airfieldName.label" default="Airport"/>

    </label>
    <g:fieldValue bean="${airportStatus}" field="airfieldName"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'overall', 'error')} ">
    <label for="overall">
        <g:message code="airportStatus.overall.label" default="Overall"/>

    </label>
    <airportLookup:select name="overall" category="airport.overallStatus" value="${airportStatus?.overall}" valueMessagePrefix="airportStatus.overall" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'ops', 'error')} ">
    <label for="ops">
        <g:message code="airportStatus.ops.label" default="Ops"/>

    </label>
    <airportLookup:select name="ops" category="airport.operationalStatus" value="${airportStatus?.ops}" valueMessagePrefix="airportStatus.ops" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'opsRemarks', 'error')} ">
    <label for="opsRemarks">
        <g:message code="airportStatus.opsRemarks.label" default="Ops Remarks"/>

    </label>
    <g:textArea name="opsRemarks" value="${airportStatus?.opsRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'mx', 'error')} ">
    <label for="mx">
        <g:message code="airportStatus.mx.label" default="Mx"/>

    </label>
    <airportLookup:select name="mx" category="airport.operationalStatus" value="${airportStatus?.mx}" valueMessagePrefix="airportStatus.mx" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'mxRemarks', 'error')} ">
    <label for="mxRemarks">
        <g:message code="airportStatus.mxRemarks.label" default="Mx Remarks"/>

    </label>
    <g:textArea name="mxRemarks" value="${airportStatus?.mxRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'muns', 'error')} ">
    <label for="muns">
        <g:message code="airportStatus.muns.label" default="Supply"/>

    </label>
    <airportLookup:select name="muns" category="airport.operationalStatus" value="${airportStatus?.muns}" valueMessagePrefix="airportStatus.muns" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'munsRemarks', 'error')} ">
    <label for="munsRemarks">
        <g:message code="airportStatus.munsRemarks.label" default="Supply Remarks"/>

    </label>
    <g:textArea name="munsRemarks" value="${airportStatus?.munsRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'pol', 'error')} ">
    <label for="pol">
        <g:message code="airportStatus.pol.label" default="POL"/>

    </label>
    <airportLookup:select name="pol" category="airport.operationalStatus" value="${airportStatus?.pol}" valueMessagePrefix="airportStatus.pol" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'polRemarks', 'error')} ">
    <label for="polRemarks">
        <g:message code="airportStatus.polRemarks.label" default="POL Remarks"/>

    </label>
    <g:textArea name="polRemarks" value="${airportStatus?.polRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'rwPri', 'error')} ">
    <label for="rwPri">
        <g:message code="airportStatus.rwPri.label" default="RW Pri"/>

    </label>
    <airportLookup:select name="rwPri" category="airport.operationalStatus" value="${airportStatus?.rwPri}" valueMessagePrefix="airportStatus.rwPri" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'rwPriRemarks', 'error')} ">
    <label for="rwPriRemarks">
        <g:message code="airportStatus.rwPriRemarks.label" default="RW Pri Remarks"/>

    </label>
    <g:textArea name="rwPriRemarks" value="${airportStatus?.rwPriRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'rwSec', 'error')} ">
    <label for="rwSec">
        <g:message code="airportStatus.rwSec.label" default="RW Sec"/>

    </label>
    <airportLookup:select name="rwSec" category="airport.operationalStatus" value="${airportStatus?.rwSec}" valueMessagePrefix="airportStatus.rwSec" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'rwSecRemarks', 'error')} ">
    <label for="rwSecRemarks">
        <g:message code="airportStatus.rwSecRemarks.label" default="RW Sec Remarks"/>

    </label>
    <g:textArea name="rwSecRemarks" value="${airportStatus?.rwSecRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'airfield', 'error')} ">
    <label for="airfield">
        <g:message code="airportStatus.airfield.label" default="Airfield"/>

    </label>
    <airportLookup:select name="airfield" category="airport.operationalStatus" value="${airportStatus?.airfield}" valueMessagePrefix="airportStatus.airfield" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'airfieldRemarks', 'error')} ">
    <label for="airfieldRemarks">
        <g:message code="airportStatus.airfieldRemarks.label" default="Airfield Remarks"/>

    </label>
    <g:textArea name="airfieldRemarks" value="${airportStatus?.airfieldRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'infrastructure', 'error')} ">
    <label for="infrastructure">
        <g:message code="airportStatus.infrastructure.label" default="Infrastructure"/>

    </label>
    <airportLookup:select name="infrastructure" category="airport.operationalStatus" value="${airportStatus?.infrastructure}" valueMessagePrefix="airportStatus.infrastructure" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'infraRemarks', 'error')} ">
    <label for="infraRemarks">
        <g:message code="airportStatus.infraRemarks.label" default="Infra Remarks"/>

    </label>
    <g:textArea name="infraRemarks" value="${airportStatus?.infraRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'atcalsNavaids', 'error')} ">
    <label for="atcalsNavaids">
        <g:message code="airportStatus.atcalsNavaids.label" default="NAVAIDS"/>

    </label>
    <airportLookup:select name="atcalsNavaids" category="airport.operationalStatus" value="${airportStatus?.atcalsNavaids}" valueMessagePrefix="airportStatus.atcalsNavaids" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'atcalsNavaidsRemarks', 'error')} ">
    <label for="atcalsNavaidsRemarks">
        <g:message code="airportStatus.atcalsNavaidsRemarks.label" default="NAVAIDS Remarks"/>

    </label>
    <g:textArea name="atcalsNavaidsRemarks" value="${airportStatus?.atcalsNavaidsRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'c4i', 'error')} ">
    <label for="c4i">
        <g:message code="airportStatus.c4i.label" default="C4I"/>

    </label>
    <airportLookup:select name="c4i" category="airport.operationalStatus" value="${airportStatus?.c4i}" valueMessagePrefix="airportStatus.c4i" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'c4iRemarks', 'error')} ">
    <label for="c4iRemarks">
        <g:message code="airportStatus.c4iRemarks.label" default="C4I Remarks"/>

    </label>
    <g:textArea name="c4iRemarks" value="${airportStatus?.c4iRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'cyber', 'error')} ">
    <label for="cyber">
        <g:message code="airportStatus.cyber.label" default="Cyber"/>

    </label>
    <airportLookup:select name="cyber" category="airport.operationalStatus" value="${airportStatus?.cyber}" valueMessagePrefix="airportStatus.cyber" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'cyberRemarks', 'error')} ">
    <label for="cyberRemarks">
        <g:message code="airportStatus.cyberRemarks.label" default="Cyber Remarks"/>

    </label>
    <g:textArea name="cyberRemarks" value="${airportStatus?.cyberRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'radio', 'error')} ">
    <label for="radio">
        <g:message code="airportStatus.radio.label" default="Radio"/>

    </label>
    <airportLookup:select name="radio" category="airport.operationalStatus" value="${airportStatus?.radio}" valueMessagePrefix="airportStatus.radio" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'radioRemarks', 'error')} ">
    <label for="radioRemarks">
        <g:message code="airportStatus.radioRemarks.label" default="Radio Remarks"/>

    </label>
    <g:textArea name="radioRemarks" value="${airportStatus?.radioRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'baseDefense', 'error')} ">
    <label for="baseDefense">
        <g:message code="airportStatus.baseDefense.label" default="Security"/>

    </label>
    <airportLookup:select name="baseDefense" category="airport.operationalStatus" value="${airportStatus?.baseDefense}" valueMessagePrefix="airportStatus.baseDefense" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'baseDefenseRemarks', 'error')} ">
    <label for="baseDefenseRemarks">
        <g:message code="airportStatus.baseDefenseRemarks.label" default="Security Remarks"/>

    </label>
    <g:textArea name="baseDefenseRemarks" value="${airportStatus?.baseDefenseRemarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: airportStatus, field: 'absUpdatedBy', 'error')} required">

    <g:hiddenField name="absUpdatedBy" value="${sec.loggedInUserInfo(field: 'username')}"/>

</div>
