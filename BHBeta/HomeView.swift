//
//  HomeView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/8/21.
//

import SwiftUI

struct HomeView: View {
    @State var showUserProfile = false
    @State var showTeamProfile = false
    @State var showServiceDetail = false
    @State var viewState = CGSize()
    var user: User
    
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.white.opacity(0.3), Color.black.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    
                    //MARK:- TITLE SECTION
                    HStack {
                        Text("Brow Haus")
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                    }
                    .padding(.top, 40)
                    .padding(.horizontal)
                    
                    
                    Divider().padding(.leading, 150).padding(.trailing, 150)
                    
                    //MARK:- USER VIEW SECTION
                    UserView()
                        .onTapGesture {
                            self.showUserProfile.toggle()
                        }
                    
                    Divider().padding(.leading, 50).padding(.trailing, 50)
                    
                    //MARK:- TEAM VIEW SECTION
                    
                    HStack {
                        Text("Team")
                            .font(.system(size: 20, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(teamData, id: \.id) { team in
                                NavigationLink(
                                    destination: TeamViewDetail(team: team),
                                    label: {
                                        TeamView(team: team)
                                    }).accentColor(.black)
                                
                            }
                        }
                    }.padding(.horizontal, 10)
                    
                    
                    Divider().padding(.leading, 50).padding(.trailing, 50)
                    
                    //MARK:- SERVICE VIEW SECTION
                    HStack {
                        Text("Services")
                            .font(.system(size: 20, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(serviceData, id: \.id) { service in
                                GeometryReader { geometry in
                                    NavigationLink(
                                        destination: ServiceViewDetail(service: service),
                                        label: {
                                            ServiceView(service: service)
                                        })
                                        .rotation3DEffect(Angle(degrees:Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                                    
                                }.frame(width: 300, height: 290).accentColor(.black) //270
                                
                            }
                        }.padding(.horizontal, 20)
                    }
                    
                    Spacer()
                }
                //MARK:- MODIFIERS FOR USERDETAILVIEW SHOW
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
                .modifier(UserProfile(showUserProfile: showUserProfile, viewState: viewState))
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
                .blur(radius: showUserProfile ? 4.0 : 0)
                
                
                UserViewDetail(showUserProfile: $showUserProfile, user: user)
                    .offset(y: showUserProfile ? -50 : screen.height)
                    .offset(y: viewState.height)
                
                
                //                    if showServiceDetail {
                //                        BlurView(style: .systemUltraThinMaterialLight)
                //                            .edgesIgnoringSafeArea(.all)
                //
                //                        ServiceViewDetail()
                //                            .offset(y: showServiceDetail ? 0 : screen.height)
                //                            .onTapGesture {
                //                                self.showServiceDetail.toggle()
                //                            }
                //                    }
                
            }
//            .background(BackgroundView())
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "raluca"), email: "", password: ""))
    }
}
