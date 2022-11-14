//
//  MotherView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/25/21.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var user: User
    
    var body: some View {
        VStack {
            if viewRouter.curentPage == "onboardingView" {
                OnboardingView(user: user)
            } else if viewRouter.curentPage == "homeView" {
                TabBarView(user: user)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "raluca"), email: "", password: ""))
            .environmentObject(ViewRouter())
    }
}
