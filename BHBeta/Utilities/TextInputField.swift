//
//  TextInputField.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import SwiftUI

struct TextInputField : View {
//    var sfSymbolName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
                
                TextField(placeHolder, text: self.$field)
                    .placeholder(when: field.isEmpty){
                        Text(placeHolder).foregroundColor(Color.black).opacity(0.6)
                    }
        }.ignoresSafeArea(.keyboard, edges: .bottom)
          
    }
}

