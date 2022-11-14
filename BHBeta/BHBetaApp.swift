//
//  BHBetaApp.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/6/21.
//

import SwiftUI

@main
struct BHBetaApp: App {
    
    var body: some Scene {
        WindowGroup {
            MotherView(user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "web"), email: "", password: ""))
                .environmentObject(ViewRouter())
                
        }
    }
}
