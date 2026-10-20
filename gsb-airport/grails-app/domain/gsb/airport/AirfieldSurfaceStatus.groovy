/*
 * 2017 6 21 - Mission Command Dev Team
 *
 */

package gsb.airport

class AirfieldSurfaceStatus {
    String objectId
    String airfieldName
    String runway
    String sectionLabel
    String condition
    String notes
    String repairStatus
    String updatedBy
    Date lastUpdated

    static constraints = {
        airfieldName nullable: true, blank: true
        runway nullable: true, blank: true
        sectionLabel nullable: true, blank: true
        condition nullable: true, blank: true
        notes nullable: true, blank: true
        repairStatus nullable: true, blank: true
        updatedBy nullable: true, blank: true
        lastUpdated nullable: true, blank: true
    }
    static mapping = {
        objectId column: 'OBJECTID'
        runway column: 'RUNWAYID'
        sectionLabel column: 'LABEL'
        condition column: 'CON'
        notes column: 'DES'
        airfieldName column: 'SITE_NAME'
        lastUpdated column: 'UPDATED_DATE'
        datasource 'geodbfour'
        table 'RUNWAYDAMAGEPOLYS'
        version false
    }
}
