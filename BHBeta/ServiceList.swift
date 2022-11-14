//
//  ServiceList.swift
//  BHBeta
//
//  Created by corneliu postolache on 3/31/22.
//

import SwiftUI

struct ServiceList: View {
    @State var serviceList: Details
    
    var body: some View {
        VStack {
            ImageList(imageName: "brows", description: serviceList.description, duration: serviceList.duration, price: serviceList.price)
        }
        
    }
}

struct ServiceList_Previews: PreviewProvider {
    static var previews: some View {
        ServiceList(serviceList: detail[0])
    }
}

struct ImageList: View {
    @State var imageName: String
    @State var description: String
    @State var duration: String
    @State var price: String
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30) {

                HStack(alignment: .top) {
                    Image(systemName: "note.text")
                        .font(.system(size: 20, weight: .bold))
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                        .padding(5)

                    Text(description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                

                HStack {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.system(size: 20, weight: .bold))
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                        .padding(5)

                    Text(duration)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                }.frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 20, weight: .bold))
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                        .padding(5)

                    Text(price)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                }
//                .frame(maxWidth: .infinity, alignment: .leading)

                Divider().padding(.leading, 20).padding(.trailing, 20)
                
            }
            .padding(20)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 180, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(y: show ? 600 : 0)
            .opacity(show ? 1 : 0)
            
            VStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)

            }
            .frame(width: show ? screen.width : screen.width - 90, height: show ? 580 : 180)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .onTapGesture {
                self.show.toggle()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
