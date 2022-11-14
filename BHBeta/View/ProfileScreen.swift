//
//  ProfileScreen.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State var logout = false
    
    var body: some View {
        
        ZStack {
            Color("primary").edgesIgnoringSafeArea(.all)
            VStack{
                
                VStack(alignment: .leading, spacing: 20) {
                    let profileDetails = AppManager.instance.getUserDetails()
                    
                    Text("Name : \(profileDetails?.firstName ?? "")")
                    Divider()
                    Text("Phone : \(profileDetails?.cellPhone ?? "")")

                    Divider()
                    
                    Text("Email : \(profileDetails?.emailID ?? "")")
                    Divider()
                    
                    Text("Address : \(profileDetails?.address ?? "")")
                    
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 25)
                
                
                Button(action: {
                    UserDefaults.standard.removeObject(forKey:Application.Keys.userDetails)
                    KeychainService().delete(for: Application.Keys.token)
                    //logout = true
//                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())

                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: LoginView())
                }) {
                    
                    Text("LOGOUT")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }.background(Color("primary"))
                .cornerRadius(8)
                .offset(y: -40)
                .padding(.bottom, -40)
                .shadow(radius: 15)
                
            }.padding()
            
        }.fullScreenCover(isPresented: $logout) {
//            ContentView() // Rajesh setup
            LoginView()
        }
        }
    }


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


