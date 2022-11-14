//
//  FormView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/24/21.
//

import SwiftUI

struct FormView: View {
    @State var service: BHService
    @State var testArray = [String]()
    
    @State var title = ""
    @State var arrayTitle = [""]
    @State var newCategory = [""]
    
    @State var category = ["brows", "lashes", "nails", "facial"]
    @State var cat = 0
    
    @State private var numberP = 2
    
    
    
    func addCategory(category: String) {
        self.newCategory.append(category)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Selectati Categoria:")) {
                    Picker("Selectati Categoria:", selection: $cat){
                        ForEach(0..<category.count, id: \.self){
                            Text(self.category[$0])
                        }
                    
                    }
//                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section{
                    Text(category[cat])
                }
                
                TextField("Introduceti titlu:", text: $title)
                
                Section {
                    Button(action: {
                        addCategory(category: category[cat])
                        arrayTitle.append(title)
                        
                    }, label: {
                        Text("Save")
                    })
                }
                
                Section {
                    ForEach(0..<newCategory.count, id: \.self){
                        Text(newCategory[$0])
                }
            }
                Section {
                    ForEach(0..<arrayTitle.count, id: \.self){
                        Text(arrayTitle[$0])
                    }
                }
        }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(service: BHService(title: "Brows", subtitle: "brows", details: [detail[0]], image: "", serviceCode: ""))
    }
}
