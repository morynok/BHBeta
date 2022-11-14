//
//  OnboardingView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/7/21.
//

import SwiftUI

struct OnboardingView: View {
    @State var showNextView = false
    @State var user: User
    //    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            if showNextView {
                //                    TabBarView(user: user)
                if let _ = AppManager.instance.getUserDetails(){
                    TabBarView(user: user)
                }else{
//                    LoginView()
                    TabBarView(user: user)
                }
            }
            
            VStack(spacing: 20) {
                Spacer()
                
                VStack {
                    Text("BrowHaus App ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                .padding()
                
                Group {
                    HStack {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("De ce Mobile App?")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Brow Haus isi doreste o interactiune cat mai simpla si personala!")
                                .font(.subheadline)
                                .fontWeight(.semibold).opacity(0.5)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Divider()
                }
                
                Group {
                    HStack {
                        Image(systemName: "creditcard.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Rezervare Online")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Posibilitatea de a face rezervarea serviciilor noastre direct din aplicatie!")
                                .font(.subheadline)
                                .fontWeight(.semibold).opacity(0.5)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Divider()
                }
                
                Group {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orientare")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Aflarea rutei catre addressa noastra din orice locatie a Dvs. !")
                                .font(.subheadline)
                                .fontWeight(.semibold).opacity(0.5)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Divider()
                }
                
                Group {
                    HStack {
                        Image(systemName: "note.text")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Notificari")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Va informam imediat ce sunt disponibile anumite servicii, promotii la produsele si serviciile Brow Haus! ")
                                .font(.subheadline)
                                .fontWeight(.semibold).opacity(0.5)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Divider()
                }
                
                Spacer()
                
                Button(action: {
                    self.showNextView = true
                    
                }, label: {
                    Text("Continue")
                        .font(.title)
                        .foregroundColor(.white)
                })
                .frame(maxWidth: .infinity - 60)
                .frame(height: 60)
                .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.top, 30)
            }
            .offset(y: showNextView ? 1000 : 0)
            .animation(.easeIn(duration: 1.0))
            .padding(30)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "raluca"), email: "", password: ""))
    }
}
