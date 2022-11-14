//
//  StaffModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

struct StaffResponse: Codable {
    let response: Bool
    let data: StaffDetails
}

// MARK: - DataClass
struct StaffDetails: Codable {
    let cursor: String?
    let staffs: [Staff]
}

// MARK: - Staff
struct Staff: Codable,Hashable {
   
    let key, firstName, lastName, emailID: String?
    let countryCode, workPhone, imageURL, comment: String?

    enum CodingKeys: String, CodingKey {
        case key
        case firstName = "first_name"
        case lastName = "last_name"
        case emailID = "email_id"
        case countryCode = "country_code"
        case workPhone = "work_phone"
        case imageURL = "image_url"
        case comment
    }
    
    
}

