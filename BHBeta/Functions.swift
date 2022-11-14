//
//  Functions.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/11/21.
//

import SwiftUI
import CoreLocation
import MapKit
import MessageUI

//MARK:- ViewRouter viw : show OnboardingView only one time either after app was just installed or after update

class ViewRouter: ObservableObject {
    @Published var curentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore"){
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            curentPage = "onboardingView"
        } else {
            curentPage = "homeView"
        }
    }
}


//MARK:- EXTRACT SERVICE CODES ACC WITH STAFF

func getCode(serviceCode: String) -> [String]{
    var names: [String] = []
    for team in teamData {
        for code in team.serviceCodes {
            if code == serviceCode {
                names.append(team.image)
            }
        }
        
    }
    return names
}


//MARK:- METHODS FOR SOCIAL LINKS ( Web / FB / Insta ) & WHATSAPP

func getWeb() {
    if let url = URL(string: Contact.web) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else { // redirect to Safari in case of no app installed
            let urlWeb = URL(string: Contact.web)!
            UIApplication.shared.open(urlWeb, options: [:], completionHandler: nil)
        }
    }
}

func getFaceBook() {
    if let url = URL(string: Contact.fb) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else { // redirect to Safari in case of no app installed
            let urlWeb = URL(string: Contact.fb)!
            UIApplication.shared.open(urlWeb, options: [:], completionHandler: nil)
        }
    }
}

func getInsta() {
    if let url = URL(string: Contact.insta) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else { // redirect to Safari in case of no app installed
            let urlWeb = URL(string: Contact.instaUrl)!
            UIApplication.shared.open(urlWeb, options: [:], completionHandler: nil)
        }
    }
}

func getWhatsApp() {
    if let url = URL(string: Contact.whatsapp) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

func getPhone() {
    if let url = URL(string: "tel://\(Contact.tel)") {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

//MARK:- MAPS LOCATION - USER CAN FIND THE DRIVING LOCATION FROM MAPS

func getLocation() {
    
    let latitude:CLLocationDegrees = Contact.latitude
    let longitude: CLLocationDegrees = Contact.longitude
    let regiondistance:CLLocationDistance = Contact.regiondistance
    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
    let regionspan  = MKCoordinateRegion(center: coordinates, latitudinalMeters: regiondistance, longitudinalMeters: regiondistance)
    let options = [MKLaunchOptionsMapCenterKey:NSValue(mkCoordinate:regionspan.center), MKLaunchOptionsMapSpanKey:NSValue(mkCoordinateSpan:regionspan.span)]

    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
    let mapitem = MKMapItem(placemark: placemark)
    mapitem.name = Contact.name
    mapitem.openInMaps(launchOptions: options)
}

class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailHelper()
    
    private override init() {
        //
    }
    
    func sendMail() {
        if !MFMailComposeViewController.canSendMail() {
            print("Cant send email - Email app not configured")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients([Contact.email])
        composeVC.setSubject(Contact.textSubject)
        composeVC.setMessageBody(Contact.textBody, isHTML: false)
        
        // Present the view controller modally.
//            self.present(composeVC, animated: true, completion: nil)
        EmailHelper.getRootViewController()?.present(composeVC, animated: true, completion: nil)
    }
        
    private func mailComposeController(controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult, error: Error?) {
            // Check the result or perform other tasks.
            
            // Dismiss the mail compose view controller.
//            controller.dismiss(animated: true, completion: nil)
            EmailHelper.getRootViewController()?.dismiss(animated: true, completion: nil)
        }
       
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }

    
}

//MARK:- MODIFIER FOR DIVIDER / LOGINVIEW

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
        
}
