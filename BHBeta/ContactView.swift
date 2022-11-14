//
//  ContactView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/14/21.
//

import SwiftUI

struct ContactView: View {
    @State var animationAmount: CGFloat = 1
    @State var iconAnimation = 0.0
    
    var body: some View {
        VStack {
            
            VStack {
                Image("bh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 350, height: 150)
            .padding()
         Spacer()
            VStack {
                Group {
                    WebLinkView()
                        .onTapGesture {
                                getWeb()
                        }
                    
                    FaceBookLink(iconAnimation: iconAnimation)
                        .onTapGesture {
                            getFaceBook()
                        }

                    
                    InstagramLink()
                        .onTapGesture {
                            getInsta()
                        }
                    
                }
                
                Group {
                    WhatsAppLink()
                        .onTapGesture {
                            getWhatsApp()
                        }
                    
                    PhoneLink()
                        .onTapGesture {
                            getPhone()
                        }
                    
                    EmailLink()
                        .onTapGesture {
                            EmailHelper.shared.sendMail()
                        }
                    
                    AddressLink(animationAmount: animationAmount)
                        .onTapGesture {
                            getLocation()
                        }
                }
            }
            .frame(width: 380, height: 450)
            .background(Color.black.opacity(0.4))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            Spacer()
        }.background(BackgroundView())
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}


//MARK:- LINK SUBVIEWS

struct WebLinkView: View {

    var body: some View {
        HStack(spacing: 20) {
            Image("chat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 3)

            Text("www.thebrowhaus.ro")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)

        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)

        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct FaceBookLink: View {
    @State var iconAnimation: Double
    
    var body: some View {
        HStack(spacing: 20) {
            Image("facebook")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 3)
                .rotation3DEffect(.degrees(iconAnimation), axis: (x: 0.0, y: 0.0, z: 1.0))
                .onAppear {
                    withAnimation(.interpolatingSpring(stiffness: 6, damping: 4.0)) {
                        self.iconAnimation += 360
                    }
                }
            
            Text("FaceBook")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct InstagramLink: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("instagram")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 3)
            
            Text("Instagram")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct WhatsAppLink: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("whatsapp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
            
            Text("WhatsApp: 0732 958 358")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct PhoneLink: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("phone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
            
            Text("Mobile: + 40 732 958 358")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct EmailLink: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "envelope.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.purple.opacity(0.7))
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
            
            Text("Email")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
        
        Divider().frame(height: 1).background(Color.white.opacity(0.4)).padding(.leading, 40).padding(.trailing, 40)
    }
}

struct AddressLink: View {
    @State var animationAmount: CGFloat
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.purple.opacity(0.7))
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
                .overlay(
                    Circle()
                        .stroke(Color.purple)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: false)
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
            
            Text("Str. Eugen Tanta nr12")
                .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .padding(.leading, 20)
    }
}
