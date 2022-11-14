//
//  HomeScreen.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import SwiftUI

import SwiftUI

struct HomeScreen: View {
    
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var buttonDisabled = true
    
    var body: some View {
        
        LoadingView(isShowing:$viewModel.showLoader){
            NavigationView {
                VStack{
                    Form {
                        Section (header: Text("Choose service & Specialist")){
                            Picker(selection: $viewModel.selectedServiceIndex, label: Text("Select Service")) {
                                ForEach(0 ..< self.viewModel.services.count, id: \.self) { index  in
                                    
                                    let data = self.viewModel.services[index]
                                    HStack{
                                        RemoteImage(url: data.imageURL ?? "")
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            Text(data.serviceName ?? "").font(.headline).multilineTextAlignment(.leading)
                                            Text(data.serviceDescription ?? "").font(.subheadline).multilineTextAlignment(.leading)
                                        })
                                        
                                        //MARK:- Added time & cost for service
                                        Spacer()
                                      
                                        VStack {
                                            Text("\(data.duration ?? 0)min").font(.headline)
                                            Text("\(data.cost ?? 0)RON").font(.headline)
                                        }
                                        .padding()
                                        
                                        
                                    }
                                }
                                
                            }.onChange(of: viewModel.selectedServiceIndex) { _ in
                                
                                viewModel.filterStaffBasedOnSelectedService()
                            }
                            
                            Picker(selection: $viewModel.selectedStaffIndex, label: Text("Choose Specialist")) {
                                ForEach(0 ..< self.viewModel.staffs.count, id: \.self) { index  in
                                    let data = self.viewModel.staffs[index]
                                    HStack{
                                        RemoteImage(url: data.imageURL ?? "")
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            Text((data.firstName ?? "") + " " + (data.lastName ?? "")).font(.headline).multilineTextAlignment(.leading)
                                        })
                                    }
                                }
                            }.onChange(of: viewModel.selectedStaffIndex) { _ in
                                viewModel.checkStaffAvailability()
                                
                            }
                        }
                        Section (header: Text("Choose prefer time")){
                            DatePicker(selection: $viewModel.date, in: Date()..., displayedComponents: .date) {
                                            Text("Choose Date")
                                        }
                            .onChange(of: viewModel.date) { _ in
                                viewModel.getAvailableTimeSlots()
                            }
                            
                            VStack{
                                HStack{
                                    Text("Available Time Slots")
                                    
                                    Spacer()
                                }.frame(height:30)
                                TimeSlotView(data: viewModel.availableSlots,selectedTime:$viewModel.selectedAppoinmentTime)
                                   .frame(height:200)
                            }
                            
                            
                        }
                        
                    }.navigationBarItems(
                        leading:
                            Text("Hello, \(viewModel.userName)")
                            .font(.title)
                            .foregroundColor(Color(.darkGray)),
                        trailing: // Add trailing view
                            NavigationLink(destination: ProfileScreen()) {
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                            }
                    )
                    Button(action:{
                        viewModel.bookAppoinment()
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:60)
                            .overlay(
                                Text("Book")
                                    .foregroundColor(.white)
                                
                            )
                        
                    }.padding()
                    .disabled(!viewModel.bookingIsEnable)
                    
                    
                }
                
            }
            
        }.alert(isPresented: $viewModel.showInputAlert) {
            Alert(title: Text("Important message"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



//MARK: Time SlotView
struct TimeSlotView: View {
    
    var data = [String]()
    
    @Binding var selectedTime: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .foregroundColor(selectedTime == item ? Color.white : Color.blue)
                        .padding(.vertical)
                        .padding(.horizontal,20)
                        .background(selectedTime == item ? Color.blue : Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .onTapGesture {
                            self.selectedTime = item
                        }
                }
            }
        }
        
    }
}


