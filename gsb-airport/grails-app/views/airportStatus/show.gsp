<%@ page import="gsb.airport.AirportStatusController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="abs_layout">
    <meta http-equiv="Refresh" content="300"/>
    <g:set var="entityName" value="${message(code: 'airportStatus.label', default: 'Airport Status')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-airportStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <ul>
            <li><a class="list" href="${createLink(uri: '/airportStatus/index')}">Airport Status</a></li>
            <li><a href="${createLink(uri: '/')}" target="_blank">GSB Home</a></li>
        </ul>
    </ul>
</div>

<div id="show-airportStatus" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list airportStatus">

        <li class="fieldcontain">
            <span id="airfieldName-label" class="property-label"><g:message code="airportStatus.airfieldName.label"
                                                                            default="Airport"/></span>

            <span class="property-value" aria-labelledby="airfieldName-label"><g:fieldValue
                    bean="${airportStatus}" field="airfieldName"/></span>

        </li>

        <li class="fieldcontain">
            <span id="overall-label" class="property-label"><g:message code="airportStatus.overall.label"
                                                                       default="Overall"/></span>

            <span class="property-value" aria-labelledby="overall-label">
                    <status:badge value="${airportStatus.overall}" width="80px" height="20px"/>
</span>

        </li>



        <li class="fieldcontain">
            <span id="ops-label" class="property-label"><g:message code="airportStatus.ops.label"
                                                                   default="Ops"/></span>

            <span class="property-value" aria-labelledby="ops-label">
                    <status:badge value="${airportStatus.ops}" width="60px" height="20px"/>
</span>

        </li>



        <li class="fieldcontain">
            <span id="opsRemarks-label" class="property-label"><g:message code="airportStatus.opsRemarks.label"
                                                                          default="Ops Remarks"/></span>

            <span class="property-value" aria-labelledby="opsRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="opsRemarks"/></span>

        </li>



        <li class="fieldcontain">
            <span id="mx-label" class="property-label"><g:message code="airportStatus.mx.label" default="Mx"/></span>

            <span class="property-value" aria-labelledby="mx-label">
                    <status:badge value="${airportStatus.mx}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="mxRemarks-label" class="property-label"><g:message code="airportStatus.mxRemarks.label"
                                                                         default="Mx Remarks"/></span>

            <span class="property-value" aria-labelledby="mxRemarks-label"><g:fieldValue bean="${airportStatus}"
                                                                                         field="mxRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="muns-label" class="property-label"><g:message code="airportStatus.muns.label"
                                                                    default="Supply"/></span>

            <span class="property-value" aria-labelledby="muns-label">
                    <status:badge value="${airportStatus.muns}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="munsRemarks-label" class="property-label"><g:message code="airportStatus.munsRemarks.label"
                                                                           default="Supply Remarks"/></span>

            <span class="property-value" aria-labelledby="munsRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="munsRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="pol-label" class="property-label"><g:message code="airportStatus.pol.label"
                                                                   default="POL"/></span>

            <span class="property-value" aria-labelledby="pol-label">
                    <status:badge value="${airportStatus.pol}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="polRemarks-label" class="property-label"><g:message code="airportStatus.polRemarks.label"
                                                                          default="POL Remarks"/></span>

            <span class="property-value" aria-labelledby="polRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="polRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="rwPri-label" class="property-label"><g:message code="airportStatus.rwPri.label"
                                                                     default="RW Pri"/></span>

            <span class="property-value" aria-labelledby="rwPri-label">
                    <status:badge value="${airportStatus.rwPri}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="rwPriRemarks-label" class="property-label"><g:message code="airportStatus.rwPriRemarks.label"
                                                                            default="RW Pri Remarks"/></span>

            <span class="property-value" aria-labelledby="rwPriRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="rwPriRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="rwSec-label" class="property-label"><g:message code="airportStatus.rwSec.label"
                                                                     default="RW Sec"/></span>

            <span class="property-value" aria-labelledby="rwSec-label">
                    <status:badge value="${airportStatus.rwSec}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="rwSecRemarks-label" class="property-label"><g:message code="airportStatus.rwSecRemarks.label"
                                                                            default="RW Sec Remarks"/></span>

            <span class="property-value" aria-labelledby="rwSecRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="rwSecRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="airfield-label" class="property-label"><g:message code="airportStatus.airfield.label"
                                                                        default="Airfield"/></span>

            <span class="property-value" aria-labelledby="airfield-label">
                    <status:badge value="${airportStatus.airfield}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="airfieldRemarks-label" class="property-label"><g:message
                    code="airportStatus.airfieldRemarks.label" default="Airfield Remarks"/></span>

            <span class="property-value" aria-labelledby="airfieldRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="airfieldRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="infrastructure-label" class="property-label"><g:message code="airportStatus.infrastructure.label"
                                                                              default="Infrastructure"/></span>

            <span class="property-value" aria-labelledby="infrastructure-label">
                    <status:badge value="${airportStatus.infrastructure}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="infraRemarks-label" class="property-label"><g:message code="airportStatus.infraRemarks.label"
                                                                            default="Infrastructure Remarks"/></span>

            <span class="property-value" aria-labelledby="infraRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="infraRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="atcalsNavaids-label" class="property-label"><g:message code="airportStatus.atcalsNavaids.label"
                                                                             default="ATCALS NAVAIDS"/></span>

            <span class="property-value" aria-labelledby="atcalsNavaids-label">
                    <status:badge value="${airportStatus.atcalsNavaids}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="atcalsNavaidsRemarks-label" class="property-label"><g:message
                    code="airportStatus.atcalsNavaidsRemarks.label" default="ATCALS NAVAIDS Remarks"/></span>

            <span class="property-value" aria-labelledby="atcalsNavaidsRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="atcalsNavaidsRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="c4i-label" class="property-label"><g:message code="airportStatus.c4i.label"
                                                                   default="C4I/Cyber"/></span>

            <span class="property-value" aria-labelledby="c4i-label">
                    <status:badge value="${airportStatus.c4i}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="c4iRemarks-label" class="property-label"><g:message code="airportStatus.c4iRemarks.label"
                                                                          default="C4I/Cyber Remarks"/></span>

            <span class="property-value" aria-labelledby="c4iRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="c4iRemarks"/></span>

        </li>

        <li class="fieldcontain">
            <span id="cyber-label" class="property-label"><g:message code="airportStatus.cyber.label"
                                                                     default="Radio Phone "/></span>

            <span class="property-value" aria-labelledby="cyber-label">
                    <status:badge value="${airportStatus.cyber}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="radioRemarks-label" class="property-label"><g:message code="airportStatus.radioRemarks.label"
                                                                            default="Radio Phone Remarks"/></span>

            <span class="property-value" aria-labelledby="radioRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="radioRemarks"/></span>

        </li>


        <li class="fieldcontain">
            <span id="baseDefense-label" class="property-label"><g:message code="airportStatus.baseDefense.label"
                                                                           default="Security"/></span>

            <span class="property-value" aria-labelledby="baseDefense-label">
                    <status:badge value="${airportStatus.baseDefense}" width="60px" height="20px"/>
</span>

        </li>

        <li class="fieldcontain">
            <span id="baseDefenseRemarks-label" class="property-label"><g:message
                    code="airportStatus.baseDefenseRemarks.label" default="Security Remarks"/></span>

            <span class="property-value" aria-labelledby="baseDefenseRemarks-label"><g:fieldValue
                    bean="${airportStatus}" field="baseDefenseRemarks"/></span>

        </li>

        <g:if test="${airportStatus?.absUpdatedBy}">
            <li class="fieldcontain">
                <span id="absUpdatedBy-label" class="property-label"><g:message code="airportStatus.absUpdatedBy.label"
                                                                                default="ABS Updated By"/></span>

                <span class="property-value" aria-labelledby="absUpdatedBy-label"><g:fieldValue
                        bean="${airportStatus}" field="absUpdatedBy"/></span>
            </li>
        </g:if>

        <g:if test="${airportStatus?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="airportStatus.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate timeZone="America/Denver"
                        date="${airportStatus?.lastUpdated}"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="mapit-label" class="property-label"><g:message code="airportStatus.mapit.label"
                                                                     default="Map Link"/></span>

            <span class="property-value" aria-labelledby="mapit-label"><g:link controller="map"
                                                                               action="index"
                                                                               params="[layer: 'airportStatus', field: 'site_name', value: airportStatus.airfieldName]"
                                                                               target="_blank"
                                                                               rel="noopener"
                                                                               title="Open map view"><gsb:mapIcon/></g:link>
            </span>

        </li>

    </ol>
    <g:form url="[resource: airportStatus, action: 'delete']" method="DELETE">
        <fieldset>
            <g:link class="edit_button" action="edit" resource="${airportStatus}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>
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
