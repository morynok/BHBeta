//
//  Service.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

//MARK: Service Response
struct ServiceResponse: Codable {
    let response: Bool
    let data: ServicesList?
    let error: String?
    let msg: String?
    
}

// MARK: - Service List
struct ServicesList: Codable {
    let services: [Service]?
}

// MARK: - Service
struct Service: Codable,Hashable {
   
    let key, serviceName: String?
    let staffKeys: [String]
    let duration, bufferDuration, cost: Int?
    let currency: Currency?
    let imageURL: String?
    let serviceDescription: String?

    enum CodingKeys: String, CodingKey {
        case key
        case serviceName = "service_name"
        case staffKeys = "staff_keys"
        case duration
        case bufferDuration = "buffer_duration"
        case cost, currency
        case imageURL = "image_url"
        case serviceDescription = "description"
    }
    
}

enum Currency: String, Codable {
    case ron = "RON"
}

