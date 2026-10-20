/*
 * 2017 6 23 - Mission Command Dev Team
 *
 */

package gsb.airport

class CurrentSIT {
    String airfieldName
    String korean
    String ceoverall
    String runway
    String runwaytwo
    String airfield
    String facilities
    String utilities
    String emerresp
    String nbcipe
    String firepersonnel
    String eodpersonnel
    String nbcpersonnel
    String engpersonnel
    String overpersonnel
    String fireassets
    String eodassets
    String nbcassets
    String snowassets
    String engassets
    String overassets
    String remarks
    String mapit
    Integer sort
    String active
    String cedUpdatedBy
    Date lastUpdated

    static constraints = {
        airfieldName nullable: true, blank: true, maxSize: 38
        korean nullable: true, blank: true, maxSize: 255
        ceoverall nullable: true, blank: true
        runway nullable: true, blank: true
        runwaytwo nullable: true, blank: true
        airfield nullable: true, blank: true
        facilities nullable: true, blank: true
        utilities nullable: true, blank: true
        emerresp nullable: true, blank: true
        nbcipe nullable: true, blank: true
        firepersonnel nullable: true, blank: true
        eodpersonnel nullable: true, blank: true
        nbcpersonnel nullable: true, blank: true
        engpersonnel nullable: true, blank: true
        overpersonnel nullable: true, blank: true
        fireassets nullable: true, blank: true
        eodassets nullable: true, blank: true
        nbcassets nullable: true, blank: true
        snowassets nullable: true, blank: true
        engassets nullable: true, blank: true
        overassets nullable: true, blank: true
        remarks nullable: true, blank: true, maxSize: 10000
        mapit nullable: true, blank: true, maxSize: 500
        sort nullable: true, blank: true, maxSize: 255
        cedUpdatedBy nullable: true, blank: true
        lastUpdated nullable: true, blank: true
    }
    static mapping = {
        remarks type: 'text', sqlType: 'text'
        table 'INDEX_AIRFIELDS'
        datasource 'geodbfour'
        runway column: 'RW_PRI'
        runwaytwo column: 'RW_SEC'
        version false
        airfieldName column: 'SITE_NAME'
    }
}
