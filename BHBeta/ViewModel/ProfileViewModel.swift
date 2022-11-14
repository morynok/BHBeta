//
//  ProfileViewModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var address = ""
    
    @Published var showLoader = false
    @Published var showInputAlert = false
    @Published var showHomeScreen = false
    
    @Published var alertMessage = ""
    
    private var triedAccessToken = false
    
    init() {
        
    }
   
}

//MARK:- Field validation Validation
extension ProfileViewModel {
    
    var isLoginInputValid: Bool {
        if email.isValidEmail && !firstName.isEmptyValue && phone.isValidPhone {return true}
        return false
    }
    
    var isSignUpInputValid: Bool {
        if email.isValidEmail && !firstName.isEmptyValue && phone.isValidPhone && !address.isEmptyValue{return true}
        return false
    }
    
    
}

extension ProfileViewModel {
    //MARK:-
    func login(){
        
        if isLoginInputValid{
            showLoader = true
            fetchUser(firstName.lowercased(), phone, email.lowercased()) { (userDetails, message) in
                self.showLoader = false
                guard let customer = userDetails else {
                    self.alertMessage = message ?? ""
                    self.showInputAlert = true
                    return
                }
                print(customer)
                AppManager.instance.saveUserDetails(customer)
                self.showHomeScreen = true
            }
        }else{
            self.alertMessage = "Please enter valid input for all fields"
            showInputAlert = true
            
        }
    }
    
    func signup(){
        
        if isSignUpInputValid {
            showLoader = true
            createNewUser(firstName.lowercased(), lastName.lowercased(), phone, email: email.lowercased(), address: address) { (user, message) in
                self.showLoader = false
                guard let customer = user else {
                    self.alertMessage = message ?? ""
                    self.showInputAlert = true
                    return
                }
                print(customer)
                AppManager.instance.saveUserDetails(customer)
                self.showHomeScreen = true
            }
        }else{
            self.alertMessage = "Please enter valid input for all fields"
            showInputAlert = true
        }
    }
    
    
    //MARK:- API Call functions
    private func createNewUser(_ firstName: String,_ lastName: String,_ mobileNo: String,email: String,address: String,completion: @escaping(Customer?,String?) -> Void){
        let url = Application.apiConstant.baseUrl + Application.apiConstant.createNewUser
        let bodyParam = ["first_name": firstName,"last_name":lastName,"cell_phone":mobileNo,"email_id":email,"address":address]
        
        NetworkHelper().sendRequest(for: CreateProfileResponse.self, url: url, method: .post, headers: Authentication().bearer, body: bodyParam) { (result) in
            switch result {
            case .success(let responseData):
                if responseData.response {
                    completion(responseData.data?.customer,nil)
                }else{
                    completion(nil,responseData.msg)
                }
            case .failure(let error):
                completion(nil,error.localizedDescription)
                print("Error:",error)
            }
        }
    }
    
    private func fetchUser(_ firstName: String,_ mobileNo: String,_ email: String, completion: @escaping (Customer?,String?)-> Void){
        
        let url = Application.apiConstant.baseUrl + Application.apiConstant.fetchCustomer
        let queryparam = "?firstname=\(firstName)&email=\(email)&phone=\(mobileNo)"
        NetworkHelper().sendRequest(for: CustomerListResponse.self, url: url.appending(queryparam), method: .get, headers: Authentication().bearer, body: nil) { (result) in
            switch result {
            case .success(let responseData):
                if responseData.response {
                    if let customers = responseData.data?.customer,customers.count > 0 {
                        completion(customers.first,nil)
                    }else{
                        completion(nil,"You not registered yet.")
                    }
                    
                }else{
                    if let error = responseData.error,error == "unauthorized_request" {
                        if !self.triedAccessToken {
                            self.refreshAccessToken { (tokenStatus) in
                                self.triedAccessToken = true
                                if tokenStatus{
                                    self.login()
                                }else {
                                   print("Tried access token failed")
                                }
                            }
                        }else{
                            completion(nil,responseData.msg)
                        }
                        
                    }else{
                        completion(nil,responseData.msg)
                    }
                    
                }
            case .failure(let error):
                completion(nil,error.localizedDescription)
                print("Error:",error)
            }
        }
    }
    
    func refreshAccessToken(completion: @escaping (Bool) -> Void){
        let url = Application.apiConstant.baseUrl + Application.apiConstant.refreshToken
        let queryParam = "?refreshToken=\(Application.credentials.baseToken)"
        NetworkHelper().sendRequest(for: RefreshTokenResponse.self, url: url.appending(queryParam), method: .get, headers: Authentication().normal, body: nil) { (result) in
            switch result {
            case .success(let responseData):
                if responseData.response {
                    if let tokenData = responseData.data,let token = tokenData.token {
                        AppManager.instance.setAccessToken(token.accessToken ?? "")
                        completion(true)
                    }
                    
                }else{
                    completion(false)
                }
            case .failure(let error):
                completion(false)
                print("Error:",error)
            }
        }
    }
}

extension String{
    var isValidEmail: Bool {
        if self.isEmptyValue{return false}
        let emailRegex = "([A-Za-z0-9._+-]+)@([a-zA-Z0-9.-]+\\.[a-zA-Z0-9-]+)"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var isEmptyValue: Bool {
        if self.trimmingCharacters(in: .whitespaces).count == 0 {return true}
        return false
    }
    var isValidPhone:Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        if phoneRegex.isEmptyValue || phoneRegex.count < 12 {
            print("wrong phone number")
            return false
        } else {
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
        }
    }
}

