
<%@ page import="gsb.airport.CurrentSITController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'currentSIT.label', default: 'CurrentSIT')}"/>
    <title>CE STATUS <g:fieldValue bean="${currentSIT}" field="airfieldName"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <gsb:renderNavLinks/>
    </ul>
</div>

<a href="#list-currentSIT" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>

    </ul>
</div>

<div id="list-currentSIT" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>

        <tr>

            <g:sortableColumn property="airfieldName" title="${message(code: 'currentSIT.airfieldName.label', default: 'Airport')}"/>


            <g:sortableColumn property="ceoverall" title="${message(code: 'currentSIT.ceoverall.label', default: 'CE Overall')}"/>

            <g:sortableColumn property="runway" title="${message(code: 'currentSIT.runway.label', default: 'RW Pri')}"/>

            <g:sortableColumn property="runwaytwo" title="${message(code: 'currentSIT.runwaytwo.label', default: 'RW Sec')}"/>

            <g:sortableColumn property="airfield" title="${message(code: 'currentSIT.airfield.label', default: 'Airfield')}"/>

            <g:sortableColumn property="facilities" title="${message(code: 'currentSIT.facilities.label', default: 'Facilities')}"/>

            <g:sortableColumn property="utilities" title="${message(code: 'currentSIT.utilities.label', default: 'Utilities')}"/>

            <g:sortableColumn property="emerresp" title="${message(code: 'currentSIT.emerresp.label', default: 'Emergency Response')}"/>

            <g:sortableColumn property="overpersonnel" title="${message(code: 'currentSIT.overpersonnel.label', default: 'Personnel')}"/>

            <g:sortableColumn property="overassets" title="${message(code: 'currentSIT.overassets.label', default: 'Assets')}"/>

            <g:sortableColumn property="lastUpdated" title="${message(code: 'currentSIT.lastUpdated.label', default: 'Updated')}"/>

            <g:sortableColumn property="mapit" title="${message(code: 'currentSIT.mapit.label', default: 'Map')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${currentSITList}" status="i" var="currentSIT">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="CurrentSIT" action="show" id="${currentSIT.id}">${fieldValue(bean: currentSIT, field: "airfieldName")}</g:link></td>


                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.ceoverall}" width="60px" height="20px"/></g:link>
</td>


                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.runway}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.runwaytwo}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.airfield}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.facilities}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.utilities}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.emerresp}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="CurrentSIT" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.overpersonnel}" width="60px" height="20px"/></g:link>
</td>

                <td>
                    <g:link controller="FireFightingAssets" action="show" id="${currentSIT.id}"><status:badge value="${currentSIT.overassets}" width="60px" height="20px"/></g:link>
</td>


                <td><g:formatDate timeZone="America/Denver"  format="dd MMM HH:mm" date="${currentSIT.lastUpdated}"/></td>

                <td><g:link controller="map"
                            action="index"
                            params="[layer: 'currentSIT', field: 'site_name', value: currentSIT.airfieldName]"
                            target="_blank"
                            rel="noopener"
                            title="Open map view"><gsb:mapIcon/></g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${currentSITCount ?: 0}"/>
    </div>

    <p><br/></p>


    <table>


                <tr class="gsb-status-legend-row">
            <td>Status Legend</td>
            <td><status:badge value="GREEN - NO SIGNIFICANT DEGRADATION" width="200px" height="40px" class="gsb-status-badge-large"/></td>
            <td><status:badge value="YELLOW - DEGRADED WITH WORK-AROUND" width="200px" height="40px" class="gsb-status-badge-large"/></td>
            <td><status:badge value="RED - DEGRADED NO WORK-AROUND" width="200px" height="40px" class="gsb-status-badge-large"/></td>
            <td><status:badge value="BLACK - INCAPACITATED" width="200px" height="40px" class="gsb-status-badge-large"/></td>
            <td></td>
        </tr>

    </table>
</div>
</body>
</html>
