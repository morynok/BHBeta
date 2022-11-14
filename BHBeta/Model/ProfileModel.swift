//
//  ProfileModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

struct CreateProfileResponse: Codable {
    let response: Bool
    let msg: String?
    let data: CustomerDetails?
    let error: String?
}

// MARK: - CustomerDetails
struct CustomerDetails: Codable {
    let customer: Customer?
}

// MARK: - Customer
struct Customer: Codable {
    let key, firstName, lastName, emailID: String?
    let countryCode, cellPhone, workPhone, homePhone: String?
    let address, city, state, postalCode: String?
    let imageURL: String?
    let comment: String?
    let additionalFields: AdditionalFields?

    enum CodingKeys: String, CodingKey {
        case key
        case firstName = "first_name"
        case lastName = "last_name"
        case emailID = "email_id"
        case countryCode = "country_code"
        case cellPhone = "cell_phone"
        case workPhone = "work_phone"
        case homePhone = "home_phone"
        case address, city, state
        case postalCode = "postal_code"
        case imageURL = "image_url"
        case comment
        case additionalFields = "additional_fields"
    }
}

// MARK: - AdditionalFields
struct AdditionalFields: Codable {
    let skypeID: String

    enum CodingKeys: String, CodingKey {
        case skypeID = "Skype_id"
    }
}


struct CustomerListResponse: Codable {
    let response: Bool
    let msg: String?
    let data: CustomerList?
    let error: String?
}

// MARK: - CustomerDetails
struct CustomerList: Codable {
    let customer: [Customer]?
}

