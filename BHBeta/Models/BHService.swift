//
//  Service.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/10/21.
//

import Foundation

struct BHService: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var details: [Details]
    var image: String
    var serviceCode: String
}

let serviceData = [
    BHService(title: "Brows", subtitle: "Iconic Brows", details: [detail[0], detail[1], detail[2]], image: "brows", serviceCode: "B"),
    BHService(title: "Lashes", subtitle: "Express Yourself",details: [detail[3]], image: "lashes1", serviceCode: "L"),
    BHService(title: "Lips", subtitle: "Be Different", details: [detail[4]], image: "lips2", serviceCode: "H"),
    BHService(title: "Nails", subtitle: "Crazy Nails", details: [detail[5]], image: "nails", serviceCode: "N"),
    BHService(title: "Facial", subtitle: "Perfect Skin",details: [detail[6], detail[7]], image: "facial1", serviceCode: "F")
]

struct Details: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var duration: String
    var price: String
}

let detail = [
    Details(name: "Powder Brows", description: "Microblading is a semi-permanent makeup procedure that allows artists to drastically correct, enhance or fully reconstruct an eyebrow. \nEyebrow Microblading is performed by manually depositing pigment under the top layer of the skin by a special hand tool.\nIt does not involve the use of a machine.\nUnlike other permanent cosmetic brow treatments, the Microblading technique involves drawing individual, crisp hair strokes that are more natural looking.", duration: "pb-10", price: "pb-$"),
    Details(name: "Henna Brows", description: "henna brows description", duration: "hn-10", price: "hn-$"),
    Details(name: "Pensat Brows", description: "pensat brows description", duration: "peb-10", price: "peb-$"),
    Details(name: "Lashes", description: "lashes description", duration: "ls-10", price: "ls-$"),
    Details(name: "Lips", description: "lips description", duration: "lp-10", price: "lp-$"),
    Details(name: "Nails", description: "nails description", duration: "nl-10", price: "nl-$"),
    Details(name: "Facial1", description: "facial1 description", duration: "f1-10", price: "f1-$"),
    Details(name: "Facial2", description: "facial description", duration: "f2-10", price: "f2-$")

]


