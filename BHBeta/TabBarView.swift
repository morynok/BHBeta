//
//  TabView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/16/21.
//

import SwiftUI

struct TabBarView: View {
    @State var user: User
    
    var body: some View {
        
            TabView(){
                LoginView().tabItem {
                    Image(systemName: "person")
                    Text("Login")
                }
                
                HomeView(user: user).tabItem {
                    Image(systemName: "bonjour")
                    Text("Home")
                }
                
                ContactView().tabItem {
                    Image(systemName: "note.text")
                    Text("Contact")
                }

        }
//        .sheet(isPresented: $showOnboarding) {
//            OnboardingView(user: user)
//        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "raluca"), email: "", password: ""))
    }
}
