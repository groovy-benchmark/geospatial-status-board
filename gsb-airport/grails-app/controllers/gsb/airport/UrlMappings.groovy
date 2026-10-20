/*
 * 2017 8 14 $today.time GSB
 *
 */
package gsb.airport

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }
        "/EngineerAssets/linkshow/$airfieldName" {
            controller = "gsb.airport.EngineerAssets"
            action = "show"
        }
        "/engineerAssets/linkshow/$airfieldName" {
            controller = "gsb.airport.EngineerAssets"
            action = "show"
        }
        "/FireFightingAssets/linkshow/$airfieldName" {
            controller = "gsb.airport.FireFightingAssets"
            action = "show"
        }
        "/fireFightingAssets/linkshow/$airfieldName" {
            controller = "gsb.airport.FireFightingAssets"
            action = "show"
        }
        "/currentSIT/linkshow/$airfieldName" {
            controller = "gsb.airport.CurrentSITController"
            action = "show"
        }
        "/currentSit/linkshow/$airfieldName" {
            controller = "gsb.airport.CurrentSITController"
            action = "show"
        }
        "/EngineerAssets/linkindex/$airfieldName" {
            controller = "gsb.airport.EngineerAssets"
            action = "index"
        }
        "/engineerAssets/linkindex/$airfieldName" {
            controller = "gsb.airport.EngineerAssets"
            action = "index"
        }
        "/FireFightingAssets/linkindex/$airfieldName" {
            controller = "gsb.airport.FireFightingAssets"
            action = "index"
        }
        "/fireFightingAssets/linkindex/$airfieldName" {
            controller = "gsb.airport.FireFightingAssets"
            action = "index"
        }
        "500"(view: '/error')
    }
}
