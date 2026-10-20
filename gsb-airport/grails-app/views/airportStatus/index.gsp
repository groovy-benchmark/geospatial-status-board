<%@ page import="gsb.airport.AirportStatusController" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="abs_layout">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'airportStatus.label', default: 'Airport Status')}"/>
    <r:layoutResources/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    %{--<ul>--}%
        %{--<gsb:renderNavLinks/>--}%
    %{--</ul>--}%
</div>
<a href="#list-airportStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>

    </ul>
</div>

<div id="list-airportStatus" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>

        <thead>
        <tr>
            <th>Airport</th>


            <th>Overall</th>

            <th class="tdl">Ops</th>

            <th>Mx</th>

            <th>Supply</th>

            <th>POL</th>

            <th class="tdl">RW Pri</th>

            <th>RW Sec</th>

            <th>Airfield</th>

            <th class="tdl">Infra</th>

            <th class="tdl">NAVAIDS</th>

            <th>C4I</th>

            <th>Cyber</th>

            <th class="tdl">Security</th>

            <th>Updated </th>

            <th>Map</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${airportStatusList}" status="i" var="airportStatus">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${airportStatus.id}">${fieldValue(bean: airportStatus, field: "airfieldName")}</g:link></td>

                <td>
                    <status:badge value="${airportStatus.overall}" width="80px" height="20px"/>
</td>

                <td class="tdl">
                    <status:badge value="${airportStatus.ops}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.mx}" width="60px" height="20px"/>
</td>


                <td>
                    <status:badge value="${airportStatus.muns}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.pol}" width="60px" height="20px"/>
</td>

                <td class="tdl">
                    <status:badge value="${airportStatus.rwPri}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.rwSec}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.airfield}" width="60px" height="20px"/>
</td>

                <td class="tdl">
                    <status:badge value="${airportStatus.infrastructure}" width="60px" height="20px"/>
</td>

                <td class="tdl">
                    <status:badge value="${airportStatus.atcalsNavaids}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.c4i}" width="60px" height="20px"/>
</td>

                <td>
                    <status:badge value="${airportStatus.cyber}" width="60px" height="20px"/>
</td>

                <td class="tdl">
                    <status:badge value="${airportStatus.baseDefense}" width="60px" height="20px"/>
</td>

                <td class="tddate"><g:formatDate timeZone="America/Denver"  format="dd MMM HH:mm" date="${airportStatus.lastUpdated}"/></td>

                <td><g:link controller="map"
                            action="index"
                            params="[layer: 'airportStatus', field: 'site_name', value: airportStatus.airfieldName]"
                            target="_blank"
                            rel="noopener"
                            title="Open map view">
                    <gsb:mapIcon/>
                </g:link>
                </td>

            </tr>
        </g:each>
        </tbody>

    </table>


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

<h3>Notes:</h3>

<p>Airfield = all airfield surfaces and support other than primary and secondary R/W (CE)</p>



<div class="nav" role="navigation">
    <ul>

    </ul>
</div>
</body>
</html>
