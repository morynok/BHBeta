//
//  TeamView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/7/21.
//

import SwiftUI

struct TeamView: View {
    var team: Team
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.black.opacity(0.2), style: StrokeStyle(lineWidth: 3))
                
                Image(team.image)
                    .renderingMode(.original)
                    .resizable()
                    .clipShape(Circle())
            }
            .frame(width: 100, height: 100)
//            .shadow(color: .black.opacity(0.3), radius: 5, x: 0.0, y: 5)
            
            Text(team.name)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black.opacity(0.6))
                .shadow(color: .black.opacity(0.5), radius: 3, x: 0.0, y: 3)
                .padding(.top, 5)
        }
        .frame(width: 110, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10)
//        .padding(.horizontal, 5)
        
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(team: teamData[0])
    }
}
