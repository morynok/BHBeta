//
//  Team.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/10/21.
//

import Foundation

struct Team: Identifiable {
    var id = UUID()
    var name: String
    var title: String
    var image: String
    var description: String
    var serviceCodes: [String]
}

let teamData = [
    Team(name: "Cherese", title: "Brow Tech", image: "cherese", description: "Best Brow Tech", serviceCodes: ["B", "F"]),
    Team(name: "Kaelin", title: "Lip Tech", image: "kaelin", description: "Best Lip Tech", serviceCodes: ["L", "F", "H"]),
    Team(name: "Loren", title: "Nail Tech", image: "loren", description: "Best Nail Tech", serviceCodes: ["L", "F", "N"]),
    Team(name: "Raluca", title: "Facial Tech", image: "raluca", description: "Best Facial Tech", serviceCodes: ["H"])
]

// B = for Brow Services , L = Lash Services, F = Facial Services, N = Nails Services, H = HyaluronPen/Lips


//MARK:- EXTRACT SERVICE CODES ACC WITH STAFF

//func getCode(serviceCode: String) -> [String]{
//    var names: [String] = []
//    for staff in staffData {
//        for code in staff.serviceCodes {
//            if code == serviceCode {
//                names.append(staff.name)
//            }
//        }
//        
//    }
//    return names
//}
