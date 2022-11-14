//
//  AppointmentModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

// MARK: - Welcome
struct AppointmentResponse: Codable {
    let response: Bool
    let msg: String?
    let data: AppointmentPayload?
}

// MARK: - DataClass
struct AppointmentPayload: Codable {
    let appointment: Appointment?
}

// MARK: - Appointment
struct Appointment: Codable {
    let key, startTime, endTime: String?
    let duration: Int?
    let staffKey, serviceKey, customerKey: String?
    let cost: Int?
    let currency, comment, label: String?

    enum CodingKeys: String, CodingKey {
        case key
        case startTime = "start_time"
        case endTime = "end_time"
        case duration
        case staffKey = "staff_key"
        case serviceKey = "service_key"
        case customerKey = "customer_key"
        case cost, currency, comment, label
    }
}

struct AvailableTimeSlotResponse: Codable {
    let response: Bool
    let msg: String?
    let data:AvailableSlots?
}


struct AvailableSlots: Codable {
    var slots:[String]?
}

