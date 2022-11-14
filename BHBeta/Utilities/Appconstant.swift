//
//  Appconstant.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

enum Application {}

extension Application {
    struct apiConstant{
        static let baseUrl = "https://developer.setmore.com/"
        static let allServices = "api/v1/bookingapi/services"
        static let refreshToken = "api/v1/o/oauth2/token"
        static let fetchAllStaff = "api/v1/bookingapi/staffs"
        static let createNewUser = "api/v1/bookingapi/customer/create"
        static let fetchCustomer = "api/v1/bookingapi/customer"
        static let fetchAvailableSlot = "api/v1/bookingapi/slots"
        static let bookAppointment = "api/v1/bookingapi/appointment/create"
        
    }
    
    struct credentials {
        static let baseToken = "r1/507c3c9dbeLjsrz5o8isfr2CPyvT8PLpMak5DLjue2wlc"
    }
    
    struct Keys {
        static let token = "accessToken"
        static let userDetails = "UserDetails"
    }
    
    struct stringConstant {
        //static let
    }
    
    struct imagesConstant {
        static let email = "envelope"
        static let person = "person"
        static let phone = "phone"
        static let address = "house"
    }
}



class Authentication {
    var bearer = ["Content-Type":"application/json","Authorization": "Bearer \(AppManager.instance.getAccessToken())"]
    var normal = ["Content-Type":"application/json"]
}

class AppManager {
    static let instance = AppManager()
    
    private var accessToken: String?
    
    func setAccessToken(_ token: String) {
        //self.accessToken = token
        KeychainService().saveToken(token, for: Application.Keys.token)
    }
    
    func getAccessToken() -> String{
        if let token = accessToken {
            return token
        }
        
        if let savedToken = KeychainService().retriveToken(for: Application.Keys.token){
            self.accessToken = savedToken
            return savedToken
        }
        return ""
    }
    
    func saveUserDetails(_ details: Customer){
        UserDefaults.standard.setCodableObject(details, forKey: "UserDetails")
    }
    
    func getUserDetails() -> Customer?{
        return  UserDefaults.standard.codableObject(dataType: Customer.self, key: "UserDetails")
    }
}

extension UserDefaults {
    func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded, forKey: defaultName)
    }
    func codableObject<T : Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }
}

