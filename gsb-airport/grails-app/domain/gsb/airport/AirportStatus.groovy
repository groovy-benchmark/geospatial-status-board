/*
 * 2017 6 21 - Mission Command Dev Team
 *
 */

package gsb.airport

/*
 * 2017 6 12 - Mission Command Dev Team
 *
 */

class AirportStatus {
    String objectId
    String airfieldName
    String overall
    String ops
    String opsRemarks
    String mx
    String mxRemarks
    String muns
    String munsRemarks
    String pol
    String polRemarks
    String rwPri
    String rwPriRemarks
    String rwSec
    String rwSecRemarks
    String airfield
    String airfieldRemarks
    String infrastructure
    String infraRemarks
    String atcalsNavaids
    String atcalsNavaidsRemarks
    String c4i
    String c4iRemarks
    String cyber
    String cyberRemarks
    String radio
    String radioRemarks
    String baseDefense
    String baseDefenseRemarks
    String mapit
    String korean
    Integer sort
    String active
    String absUpdatedBy
    Date lastUpdated
    Integer sortBy

    static constraints = {
        objectId nullable: true, blank: true
        airfieldName nullable: true, blank: true
        overall nullable: true, blank: true
        ops nullable: true, blank: true
        opsRemarks nullable: true, blank: true
        mx nullable: true, blank: true
        mxRemarks nullable: true, blank: true
        muns nullable: true, blank: true
        munsRemarks nullable: true, blank: true
        pol nullable: true, blank: true
        polRemarks nullable: true, blank: true
        rwPri nullable: true, blank: true
        rwPriRemarks nullable: true, blank: true
        rwSec nullable: true, blank: true
        rwSecRemarks nullable: true, blank: true
        airfield nullable: true, blank: true
        airfieldRemarks nullable: true, blank: true
        infrastructure nullable: true, blank: true
        infraRemarks nullable: true, blank: true
        atcalsNavaids nullable: true, blank: true
        atcalsNavaidsRemarks nullable: true, blank: true
        c4i nullable: true, blank: true
        c4iRemarks nullable: true, blank: true
        cyber nullable: true, blank: true
        cyberRemarks nullable: true, blank: true
        radio nullable: true, blank: true
        radioRemarks nullable: true, blank: true
        baseDefense nullable: true, blank: true
        baseDefenseRemarks nullable: true, blank: true
        mapit nullable: true, blank: true, maxSize: 500
        korean nullable: true, blank: true, maxSize: 255
        sort nullable: true, blank: true, maxSize: 255
        active nullable: true, blank: true, maxSize: 255
        absUpdatedBy nullable: true, blank: true
        lastUpdated nullable: true, blank: true
        sortBy nullable: true, blank: true
    }
    static mapping = {
        opsRemarks type: 'text', sqlType: 'text'
        mxRemarks type: 'text', sqlType: 'text'
        munsRemarks type: 'text', sqlType: 'text'
        polRemarks type: 'text', sqlType: 'text'
        rwPriRemarks type: 'text', sqlType: 'text'
        rwSecRemarks type: 'text', sqlType: 'text'
        airfieldRemarks type: 'text', sqlType: 'text'
        infraRemarks type: 'text', sqlType: 'text'
        atcalsNavaidsRemarks type: 'text', sqlType: 'text'
        c4iRemarks type: 'text', sqlType: 'text'
        cyberRemarks type: 'text', sqlType: 'text'
        radioRemarks type: 'text', sqlType: 'text'
        baseDefenseRemarks type: 'text', sqlType: 'text'
        objectId column: 'OBJECTID'
        airfieldName column: 'SITE_NAME'
        lastUpdated column: 'UPDATED_DATE'
        table 'INDEX_AIRFIELDS'
        datasource 'geodbfour'
        version false
    }
}
