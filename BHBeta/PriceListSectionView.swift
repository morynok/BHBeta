//
//  PriceListSectionView.swift
//  BHBeta
//
//  Created by corneliu postolache on 11/2/21.
//

import SwiftUI

struct PriceListSectionView: View {
    var title: String = "Brows"
    var subTitle: String = " henna brows"
    var image: String = "lips1"
    @State var sectionDetail : [Details]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .padding()
            
            Divider()
            
            ForEach(sectionDetail) { section in
                HStack {
                    Image(image)
                        .resizable()
    //                    .aspectRatio(contentMode: .fill)
    //                    .scaledToFit()
                        .frame(width: 100, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .padding()
                    
                    Text(section.name)
                    Spacer()
                    Text(section.price)
                        .padding(.trailing, 10)
                }
            }
        }
        .background(Color.black.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: .black.opacity(0.3), radius: 0, x: 0, y: 10)
        .padding()
        
    }
}

struct PriceListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        PriceListSectionView(sectionDetail: [Details(name: "", description: "", duration: "", price: "$$")])
    }
}
