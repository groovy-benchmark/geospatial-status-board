/*
 * 2017 6 21 - Mission Command Dev Team
 *
 */

package gsb.airport

class FireFightingAssets {
    String airfieldName
    String locationName
    String serviceOwner
    String itemName
    String utc
    String nsn
    Float avai
    Float auth
    Float numShort
    Float numExcess
    Float percentage
    String remarks
    Date dateCreated
    Date lastUpdated
    String createdBy
    String editedBy


    static mapping = {
        numShort formula: 'auth - avai'
        numExcess formula: 'avai - auth'
        percentage formula: 'case when auth = 0 then 0 else avai / auth end'
        remarks type: 'text', sqlType: 'text'
        datasource 'geodbfour'
    }
    static constraints = {
        airfieldName nullable: true, blank: true
        locationName nullable: true, blank: true
        serviceOwner nullable: true, blank: true
        itemName nullable: true, blank: true
        utc nullable: true, blank: true
        nsn nullable: true, blank: true
        avai nullable: false, blank: false
        auth nullable: false, blank: false
        numShort nullable: true, blank: true
        numExcess nullable: true, blank: true
        percentage nullable: true, blank: true
        remarks nullable: true, blank: true, maxsize: 20000
        createdBy nullable: true, blank: true, maxSize: 200
        editedBy nullable: true, blank: true, maxSize: 200
    }
}
