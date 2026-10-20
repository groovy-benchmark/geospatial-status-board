/*
 * 2017 6 21 - Mission Command Dev Team
 *
 */

package gsb.airport

class UtilityStatus {

    String airfieldName
    String potableWater
    String nonPotableWater
    String electricalPower
    String sewage
    String fuel
    Date updatedDate

    static constraints = {
    }

    static mapping = {
        datasource 'geodbfour'
    }
}
