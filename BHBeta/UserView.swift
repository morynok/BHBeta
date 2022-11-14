//
//  UserView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/6/21.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.black.opacity(0.2), style: StrokeStyle(lineWidth: 3))
                
                Image("user")
                    .renderingMode(.original)
                    .resizable()
                    .clipShape(Circle())
//                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10)
            }
            .frame(width: 100, height: 100)
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0.0, y: 10)
            
            Text("User Name")
                .font(.system(size: 20, weight: .medium))
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
