//
//  User.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/10/21.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var nameFirst: String
    var nameLast: String
    var image: UIImage
    var imageTest = UIImage(imageLiteralResourceName: "card")
    var email: String
    var password: String
    
}
