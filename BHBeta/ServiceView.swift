//
//  ServiceView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/7/21.
//

import SwiftUI

struct ServiceView: View {
    var service: BHService
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                GeometryReader { geo in
                Image(service.image)
                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 20)
                    .frame(width: geo.size.width, height: geo.size.height + 30)
                }
                
                
                VStack {
                    VStack(alignment: .leading) {
                        Text(service.title)
                            .font(Font.custom("Quentin", size: 30))
                            .foregroundColor(Color(#colorLiteral(red: 0.7529411765, green: 0.6039215686, blue: 0.3568627451, alpha: 1)))
                        Spacer()
//                        Text(service.subtitle)
//                            .font(Font.custom("Quentin", size: 30))
//                            .foregroundColor(Color(#colorLiteral(red: 0.7529411765, green: 0.6039215686, blue: 0.3568627451, alpha: 1)))
//                            .padding(.bottom, 5)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                 
                    
                    Spacer()
                    
                  
                  
                }.padding(.leading, 10)
                .padding(.top, 10)

//                            .padding(.bottom, 5)
                
                
            }
            VStack(alignment: .center) {
                Text(service.subtitle)
                    .font(Font.custom("Quentin", size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 0.7529411765, green: 0.6039215686, blue: 0.3568627451, alpha: 1)))
                    .shadow(color: .black, radius: 10, x: 0.0, y: 10)
            }.frame(maxWidth: .infinity)
        }
        .frame(width: 280, height: 220)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0.0, y: 10)
        .padding()
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(service: serviceData[3])
    }
}
