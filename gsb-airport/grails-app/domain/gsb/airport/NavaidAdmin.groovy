/*
 * 2017 6 21 - Mission Command Dev Team
 *
 */

package gsb.airport

class NavaidAdmin {
    String objectId
    String airfieldName
    String owner
    String navaidName
    String navaidType
    String status
    String statusNote
    String updatedBy
    Date lastUpdated


    static constraints = {
        objectId nullable: true, blank: true
        airfieldName nullable: true, blank: true
        owner nullable: true, blank: true
        navaidName nullable: true, blank: true
        navaidType nullable: true, blank: true
        status nullable: true, blank: true
        statusNote nullable: true, blank: true
        updatedBy nullable: true, blank: true
        lastUpdated nullable: true, blank: true
    }
    static mapping = {
        statusNote type: 'text', sqlType: 'text'
        airfieldName column: 'SITE_NAME'
        datasource 'geodbfour'
        table 'NAVIGATIONALAID'
        version false
    }
}

