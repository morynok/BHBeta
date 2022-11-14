//
//  UserViewDetails.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/6/21.
//

import SwiftUI

struct UserViewDetail: View {
    @Binding var showUserProfile: Bool
    var user: User
    
    var body: some View {
        ZStack {Color(.black).opacity(0.3)
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    UserViewDetailRow(userImage: "person.circle", userDetail: "UserName")
                    UserViewDetailRow(userImage: "envelope", userDetail: "Email")
                    UserViewDetailRow(userImage: "phone", userDetail: "Phone")
                    UserViewDetailRow(userImage: "bookmark", userDetail: "Bookings")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.1), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)).opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0.0, y: 20)
                .padding(.horizontal, 30)
                .overlay(
                    ZStack {
                        Circle()
                            .stroke(Color.black.opacity(0.3), lineWidth: 3)
                        
                        Image(uiImage: showUserProfile ? user.image : user.imageTest)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(3)
                    }
                    .frame(width: 60, height: 60)
                    .offset(y: -150)
                )
            }
            .padding(.bottom, screen.height / 7)
    //        .background(BlurView(style: .systemUltraThinMaterialLight))
//            .edgesIgnoringSafeArea(.all)
//            .onTapGesture {
//                self.showUserProfile.toggle()
//        }
        }.edgesIgnoringSafeArea(.all)
    .onTapGesture {
        self.showUserProfile.toggle()
    }
        
    }
}

struct UserViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserViewDetail(showUserProfile: .constant(false), user: User(nameFirst: "", nameLast: "", image: #imageLiteral(resourceName: "raluca"), email: "", password: ""))
    }
}

struct UserViewDetailRow: View {
    var userImage: String
    var userDetail: String
    
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: userImage)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            
            Text(userDetail)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
