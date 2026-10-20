<table style="width: 350px">
    <tbody>

<g:if test="${currentSIT?.ceoverall}">
<tr>
        <td id="ceoverall-label" class="h4" style="font-weight: bolder"><g:message code="currentSIT.ceoverall.label" default="CE Overall Assessment"/></td>

        <td class="property-value" aria-labelledby="ceoverall-label">
                    <status:badge value="${currentSIT.ceoverall}" width="120px" height="30px"/>
</td>

    </g:if>
    </tr>
    </tbody>
</table>
<table style="width: 850px">
    <tbody>
    <tr>
    <g:if test="${currentSIT?.runway}">

        <td id="runway-label" class="property-label3"><g:message code="currentSIT.runway.label" default="RWY Pri"/></td>

        <td class="property-value" aria-labelledby="runway-label">
                    <status:badge value="${currentSIT.runway}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.runwaytwo}">

        <td id="runwaytwo-label" class="property-label3"><g:message code="currentSIT.runwaytwo.label" default="RWY Sec"/></td>

        <td class="property-value" aria-labelledby="runwaytwo-label">
                    <status:badge value="${currentSIT.runwaytwo}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.airfield}">

        <td id="airfield-label" class="property-label3"><g:message code="currentSIT.airfield.label" default="Airfield"/></td>

        <td class="property-value" aria-labelledby="airfield-label">
                    <status:badge value="${currentSIT.airfield}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.facilities}">

        <td id="facilities-label" class="property-label3"><g:message code="currentSIT.facilities.label" default="Facilities"/></td>

        <td class="property-value" aria-labelledby="facilities-label">
                    <status:badge value="${currentSIT.facilities}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.utilities}">

        <td id="utilities-label" class="property-label3"><g:message code="currentSIT.utilities.label" default="Utilities"/></td>

        <td class="property-value" aria-labelledby="utilities-label">
                    <status:badge value="${currentSIT.utilities}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.emerresp}">

        <td id="emerresp-label" class="property-label3"><g:message code="currentSIT.emerresp.label" default="Emergency Response"/></td>

        <td class="property-value" aria-labelledby="emerresp-label">
                    <status:badge value="${currentSIT.emerresp}" width="75px" height="20px"/>
</td>

    </g:if>
    </tr>
    </tbody>
</table>
<table style="width: 1000px">
    <tbody>
    </tbody>
</table>
<hr>
<table style="width: 1000px">
    <tbody>
    <td id="engOffAvai-label" class="h4" style="font-weight: bolder"><g:message code="personnel.engOffAvai.label" default="Personnel"/></td>
    </tbody>
</table>
<table>
    <tbody style="width: 1000px">
    <g:if test="${currentSIT?.overpersonnel}">

        <td id="overpersonnel-label" class="property-label3"><g:message code="currentSIT.overpersonnel.label" default="Personnel Overall"/></td>

        <td class="property-value" aria-labelledby="overpersonnel-label">
                    <status:badge value="${currentSIT.overpersonnel}" width="100px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.firepersonnel}">

        <td id="firepersonnel-label" class="property-label3"><g:message code="currentSIT.firepersonnel.label" default="Fire Personnel"/></td>

        <td class="property-value" aria-labelledby="firepersonnel-label">
                    <status:badge value="${currentSIT.firepersonnel}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.eodpersonnel}">

        <td id="eodpersonnel-label" class="property-label3"><g:message code="currentSIT.eodpersonnel.label" default="EOD Personnel"/></td>

        <td class="property-value" aria-labelledby="eodpersonnel-label">
                    <status:badge value="${currentSIT.eodpersonnel}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.nbcpersonnel}">

        <td id="nbcpersonnel-label" class="property-label3"><g:message code="currentSIT.nbcpersonnel.label" default="CBRN Personnel"/></td>

        <td class="property-value" aria-labelledby="nbcpersonnel-label">
                    <status:badge value="${currentSIT.nbcpersonnel}" width="75px" height="20px"/>
</td>

    </g:if>

    <g:if test="${currentSIT?.engpersonnel}">

        <td id="engpersonnel-label" class="property-label3"><g:message code="currentSIT.engpersonnel.label" default="Engineer Personnel"/></td>

        <td class="property-value" aria-labelledby="engpersonnel-label">
                    <status:badge value="${currentSIT.engpersonnel}" width="75px" height="20px"/>
</td>

    </g:if>

    </tbody>
</table>
<hr>
<table>
    <tbody>
    <td id="engOffAvai-label" class="h4" style="font-weight: bolder"><g:message code="personnel.engOffAvai.label" default="Assets "/></td>
    </tbody>
</table>
<table style="width: 350px">
    <tbody>
    <g:if test="${currentSIT?.overassets}">

        <td id="overassets-label" class="property-label3"><g:message code="currentSIT.overassets.label" default="Assets Overall"/></td>

        <td class="property-value" aria-labelledby="overassets-label">
                    <status:badge value="${currentSIT.overassets}" width="100px" height="20px"/>
</td>

    </g:if>
    </tbody>
</table>
<table style="width: 650px">
    <tbody>

    <g:if test="${currentSIT?.fireassets}">

        <td id="fireassets-label" class="property-label3"><g:message code="currentSIT.fireassets.label" default="Fire Assets"/></td>

        <td class="property-value" aria-labelledby="fireassets-label">
                    <status:badge value="${currentSIT.fireassets}" width="75px" height="20px"/>
</td>

    </g:if>

    <td id="nbcassets-label" class="property-label3"></td>
    <td class="property-label3" aria-labelledby="fireassets-label"><g:link controller="FireFightingAssets" action="index" >Fire Fighting Asset List</g:link></td>

    </tbody>
</table>
<table style="width: 600px">
    <tbody>

    <g:if test="${currentSIT?.eodassets}">

        <td id="eodassets-label" class="property-label3"><g:message code="currentSIT.eodassets.label" default="EOD Assets"/></td>

        <td class="property-value" aria-labelledby="eodassets-label">
                    <status:badge value="${currentSIT.eodassets}" width="75px" height="20px"/>
</td>

    </g:if>

    </tbody>
</table>
<table style="width: 600px">
    <tbody>
    <g:if test="${currentSIT?.nbcassets}">

        <td id="nbcassets-label" class="property-label3"><g:message code="currentSIT.nbcassets.label" default="CBRN Assets"/></td>

        <td class="property-value" aria-labelledby="nbcassets-label">
                    <status:badge value="${currentSIT.nbcassets}" width="75px" height="20px"/>
</td>

    </g:if>
    </tbody>
</table>
<table style="width: 600px">
    <tbody>

    <g:if test="${currentSIT?.engassets}">

        <td id="engassets-label" class="property-label3"><g:message code="currentSIT.engassets.label" default="Engineer Assets"/></td>

        <td class="property-value" aria-labelledby="engassets-label">
                    <status:badge value="${currentSIT.engassets}" width="75px" height="20px"/>
</td>

    </g:if>

    <td id="nbcassets-label" class="property-label3"></td>
    <td class="property-label3" aria-labelledby="fireassets-label"><g:link controller="EngineerAssets" action="index" >Engineer Asset List</g:link></td>
    </tr>
    </tbody>
</table>
<table style="width: 600px">
    <tbody>
    <g:if test="${currentSIT?.snowassets}">

        <td id="snowassets-label" class="property-label3"><g:message code="currentSIT.snowassets.label" default="Snow Removal Assets"/></td>

        <td class="property-value" aria-labelledby="snowassets-label">
                    <status:badge value="${currentSIT.snowassets}" width="75px" height="20px"/>
</td>

    </g:if>

    </tbody>
</table>
