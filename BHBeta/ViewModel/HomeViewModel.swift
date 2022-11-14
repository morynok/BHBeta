//
//  HomeViewModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    init() {
        getAllServices()
    }
    @Published var services = [Service]()
    
    @Published var staffs = [Staff]()
    
    private var allStaffs = [Staff]()
    
    private var triedAccessToken = false
    
    @Published var showLoader = false
    @Published var showInputAlert = false
    
    @Published var selectedService:Service?
    
    @Published var selectedStaff:Staff?
    
    @Published  var date = Date()
    
    @Published  var time = Date()
    
    @Published var selectedServiceIndex = -1
    
    @Published var selectedStaffIndex = -1
       
    @Published var alertMessage = ""
    
    @Published var selectedAppoinmentTime = ""
    
    @Published var availableSlots = [String]()
    
    @Published var bookingIsEnable = false
    
    
}

extension HomeViewModel {
    
     func getAllServices(){
        self.showLoader = true
        let url = Application.apiConstant.baseUrl + Application.apiConstant.allServices
        NetworkHelper().sendRequest(for: ServiceResponse.self, url: url, method: .get, headers: Authentication().bearer, body: nil) { (result) in
            self.showLoader = false
            switch result {
            case .success(let response):
                if let error = response.error,error == "unauthorized_request" {
                    if !self.triedAccessToken {
                        self.refreshAccessToken { (tokenStatus) in
                            self.triedAccessToken = true
                            if tokenStatus{
                                self.getAllServices()
                            }else {
                               print("Tried access token failed")
                            }
                        }
                    }
                    
                }else if response.response {
                    self.services = response.data?.services ?? [Service]()
                    self.getAllStaff()
                }
               
            case .failure(let error):
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
    
    func getAllStaff(){
        self.showLoader = true
        let url = Application.apiConstant.baseUrl + Application.apiConstant.fetchAllStaff
        NetworkHelper().sendRequest(for: StaffResponse.self, url: url, method: .get, headers: Authentication().bearer, body: nil) { (result) in
            self.showLoader = false
            switch result {
            case .success(let response):
                self.allStaffs = response.data.staffs
            case .failure(let error):
                print("Error:",error)
            }
        }
    }
    
    func bookAppoinment(){
        if selectedServiceIndex < 0 || selectedStaffIndex < 0 {return}
        if self.selectedAppoinmentTime.count == 0 {
            showInputAlert = true
            alertMessage = "Please choose preferable time from available slot!"
            return
        }
        let url = Application.apiConstant.baseUrl + Application.apiConstant.bookAppointment
        let staffID = staffs[selectedStaffIndex].key
        let serviceID = services[selectedServiceIndex].key
        let userID = AppManager.instance.getUserDetails()?.key
        let appoinmentTime = selectedAppoinmentTime.replacingOccurrences(of: ".", with: ":")
        
        let appoinmentEndTime = appoinmentTime.addTimeIntervelInStringValue()
       
        let inputParam = ["staff_key":staffID,"service_key":serviceID,"":serviceID,"customer_key":userID,"start_time":getDateAndTimeExpectFormat(date, timeValue: appoinmentTime),"end_time":getDateAndTimeExpectFormat(date, timeValue: appoinmentEndTime)]
        
        print(inputParam)
        self.showLoader = true
        NetworkHelper().sendRequest(for: AppointmentResponse.self, url: url, method: .post, headers: Authentication().bearer, body: inputParam as JSON) { (result) in
            self.showLoader = false
            switch result {
            case .success(let response):
                self.alertMessage = response.msg ?? ""
                self.showInputAlert = true
            case .failure(let error):
                print("Error:",error)
                self.alertMessage = error.localizedDescription
                self.showInputAlert = true
            }
        }
    }
    
    
    func getAvailableTimeSlots(){
        if selectedServiceIndex < 0 || selectedStaffIndex < 0 {return}
        let url = Application.apiConstant.baseUrl + Application.apiConstant.fetchAvailableSlot
        let staffID = allStaffs[selectedStaffIndex].key
        let serviceID = services[selectedServiceIndex].key
        let dateValue = date.timeSlotFormat
        let inputParam = ["staff_key":staffID,"service_key":serviceID,"":serviceID,"selected_date":dateValue]
        
        print(inputParam)
        self.showLoader = true
        NetworkHelper().sendRequest(for: AvailableTimeSlotResponse.self, url: url, method: .post, headers: Authentication().bearer, body: inputParam as JSON) { (result) in
            self.showLoader = false
            switch result {
            case .success(let response):
                if let slotData = response.data, let slots = slotData.slots,slots.count > 0{
                    self.availableSlots = slots
                    self.bookingIsEnable = true
                }else{
                    self.bookingIsEnable = false
                    self.availableSlots = []
                    self.alertMessage = "No Available Slots!"
                    self.showInputAlert = true
                }

            case .failure(let error):
                print("Error:",error)
                self.alertMessage = error.localizedDescription
                self.showInputAlert = true
            }
        }
    }
    
    func filterStaffBasedOnSelectedService(){
        if selectedServiceIndex < 0 {return}
        self.selectedService = services[self.selectedServiceIndex]
        if allStaffs.count == 0 {return}
        if selectedService?.staffKeys.count == 0 {return}
        var fillterStatfs = [Staff]()
        
        for staffIDs in selectedService?.staffKeys ?? [] {
            let staffs = allStaffs.filter({$0.key == staffIDs})
            fillterStatfs += staffs
        }
        self.staffs = fillterStatfs
        self.selectedStaff = nil
        self.availableSlots = []
        self.selectedAppoinmentTime = ""
        self.bookingIsEnable = false
        self.selectedStaffIndex = -1
        if staffs.count > 0 {
            getAvailableTimeSlots()
        }
    }
    
    func checkStaffAvailability(){
        if staffs.count == 0 {return}
        if self.selectedStaffIndex < 0 {return}
        self.selectedStaff = self.staffs[self.selectedStaffIndex]
        getAvailableTimeSlots()
    }
    
    var userName: String {
        if let user = AppManager.instance.getUserDetails() {
            return user.firstName ?? ""
        }
        return ""
    }
   private func getDateAndTimeExpectFormat(_ dateValue: Date,timeValue: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        //let hourString = formatter.string(from: timeValue)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy-MM-dd"
        let dateString = formatter2.string(from: dateValue)
        
        return "\(dateString)T\(timeValue)Z"
        
        
    }
}


extension Date {
    var serverFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        return dateFormatter.string(from: self)
    }
    
    var timeSlotFormat: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter.string(from: self)
    }
    
    var roundUpToNearestQuarterHour: Date{


        var comp = Calendar.current.dateComponents(in: TimeZone.current, from: self)

        let minute = comp.minute
        
        let remainder = minute ?? 0 % 30;
        let rounded = minute ?? 0 + 30 - remainder;

        comp.setValue(rounded, for: .minute)

        return comp.date ?? Date()

    }
    
    
    var nextRoundOffTime: String{
        
        let currenttime = self.addingTimeInterval(30 * 60).rounded(minutes: 30)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: currenttime)
    }
    
    enum DateRoundingType {
        case round
        case ceil
        case floor
    }


        func rounded(minutes: TimeInterval, rounding: DateRoundingType = .round) -> Date {
            return rounded(seconds: minutes * 60, rounding: rounding)
        }
        func rounded(seconds: TimeInterval, rounding: DateRoundingType = .round) -> Date {
            var roundedInterval: TimeInterval = 0
            switch rounding  {
            case .round:
                roundedInterval = (timeIntervalSinceReferenceDate / seconds).rounded() * seconds
            case .ceil:
                roundedInterval = ceil(timeIntervalSinceReferenceDate / seconds) * seconds
            case .floor:
                roundedInterval = floor(timeIntervalSinceReferenceDate / seconds) * seconds
            }
            return Date(timeIntervalSinceReferenceDate: roundedInterval)
        }

}


extension String {
    func addTimeIntervelInStringValue(interval:Int = 30) -> String {
        let appoinmentTime = self.replacingOccurrences(of: ".", with: ":")
        
        let values = appoinmentTime.split(separator: ":")
        if values.count > 1{
            if let endTime = values.last{
                let endTimeInt = (Int(endTime) ?? 0) + interval
                
                if endTimeInt > 60 {
                    let dividedValue = endTimeInt % 60
                    if let endHours = values.first {
                        let endHourInt = (Int(endHours) ?? 0) + 1
                        return ("\(endHourInt):\(dividedValue)")
                    }
                }else if endTimeInt == 60 {
                    if let endHours = values.last {
                        let endHourInt = (Int(endHours) ?? 0) + 1
                        return ("\(endHourInt):00")
                    }
                }else{
                    return "\(values.first ?? ""):\(endTimeInt)"
                }
            }
        }else{
            return self
        }
        return self
    }
}

