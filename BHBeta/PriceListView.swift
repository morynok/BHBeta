//
//  PriceListView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/19/21.
//

import SwiftUI

struct PriceListView: View {
    @State var service = serviceData
    
    var body: some View {
        
//        NavigationView {
            
            VStack {
                ScrollView {
    //            List {
                    ForEach(service) { section in
    //                    Section(header: Text(section.title).font(.title)) {
    //                        ForEach(section.details) { item in
                                
                                PriceListSectionView(title: section.title, subTitle: section.subtitle, image: section.image, sectionDetail: section.details)
                                
    //                            HStack {
    //                                Image(section.image)
    //                                    .resizable()
    //                                    .scaledToFit()
    //                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous), style: FillStyle())
    //                                    .frame(width: 60, height: 60)
    //
    //                                Text(item.name)
    //                                    .font(.title2)
    //                                Spacer()
    //                                Text(item.price)
    //                            }
                                
    //                        }
                            
    //                    }
                    }
    //            }
    //            .navigationBarItems(trailing:
    //                                    Button(action: {}, label: {
    //                                        Image(systemName: "plus")
    //                                    })
    //            )
                }
            }.background(BackgroundView())
//    }
    }
}

struct PriceListView_Previews: PreviewProvider {
    static var previews: some View {
        PriceListView()
    }
}
