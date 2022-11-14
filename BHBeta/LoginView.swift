//
//  LoginView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/16/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = " Something went wrong."
    @State var showSignup = false       // to show name field for signup pressed button
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
//                Color(.black).edgesIgnoringSafeArea(.all)
                
                ZStack {
                    Image("login")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: bounds.size.width, maxHeight: bounds.size.height + bounds.safeAreaInsets.top + bounds.safeAreaInsets.bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                //MARK:- SIGNUP VIEW
                VStack {

                    //MARK: TEXTFIELDS FOR FIRST NAME - RAJESH
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color("secondary"))
                            .font(.system(size: 30))
                            .frame(width: 44, height: 44)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 3.0)
                            .padding(.leading)

                        TextInputField(placeHolder: "Name", prompt: "Enter Valid name", field: $viewModel.firstName)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0.0, y: 5.0)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                          
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("secondary"))
                        .padding(.leading, 30)
                    
                        //MARK: TextField FOR MOBILE - RAJESH
                    HStack {
                        Image(systemName: "phone.circle.fill")
                            .foregroundColor(Color("secondary"))
                            .font(.system(size: 30))
                            .frame(width: 44, height: 44)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 3.0)
                            .padding(.leading)
                        
                        TextInputField(placeHolder: "Mobile number with country code", prompt: "Enter Valid number", field: $viewModel.phone).textContentType(.telephoneNumber)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0.0, y: 5.0)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                        
                        //                        SecureField("".uppercased(), text: $password)
                        //                            .placeholder(when: password.isEmpty){
                        //                                Text("password").foregroundColor(Color("secondary")).opacity(0.4)
                        //                    }
                        
                    }
                    
                    //MARK: ADDITIONAL FIELD FOR EMAIL - RAJESH
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("secondary"))
                        .padding(.leading, 30)
                    
                    HStack {
                        Image(systemName: "envelope.circle.fill")
                            .foregroundColor(Color("secondary"))
                            .font(.system(size: 30))
                            .frame(width: 44, height: 44)
                            //                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 3.0)
                            .padding(.leading)
                        
                        //MARK: TextField For Email
                        TextInputField(placeHolder: "Email", prompt: "Enter Valid name", field: $viewModel.email).textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0.0, y: 5.0)
                            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            //                                .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                        
                    }
                    
                    
                    if showSignup {
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color("secondary"))
                            .padding(.leading, 30)
                        
                    HStack {
                        Image(systemName: "house.circle")
                            .foregroundColor(Color("secondary"))
                            .font(.system(size: 30))
                            .frame(width: 44, height: 44)
//                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 3.0)
                            .padding(.leading)

                        
                        //MARK: TextField For ADDRESS - Rajesh / EXTRA FIELD FOR ADRESS IN CASE OF SIGNUP
                        TextInputField(placeHolder: "Country", prompt: "Enter Valid name", field: $viewModel.address).textContentType(.emailAddress)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0.0, y: 5.0)
                            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                        
//                        TextField("".uppercased(), text: $name)
//                            .placeholder(when: name.isEmpty){ // modifier for placeholder color
//                                Text("name").foregroundColor(Color("secondary")).opacity(0.4)
//                            }
                            
                            }
                    }
                  
                    }
                    
     
                }
                .frame(height: showSignup ? 250 : 180) // originaly frame height : 150 / 136 before R adaptation
                .frame(maxWidth: .infinity)
//                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: bounds.size.height / 10)//(y: 180)
                    
                    //MARK:- FIELD FOR LOGIN / BUTTONS WITH ALLERTS
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.showAlert = true
                                self.isFocused = false
                                self.hideKeyboard()
                                viewModel.login()
//                                self.viewModel.showHomeScreen = true
                            } ) {
                                Text("Log in")
                                    .foregroundColor(.black)
                            }
                            .padding(12)
                            .padding(.horizontal, 30)
                            .background(Color("secondary"))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: Color("secondary").opacity(0.3), radius: 10, x: 0, y: 10)
//                            .alert(isPresented: $showAlert) {
//                                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    
                    
                        HStack {
                            Spacer()
                                Button(action: {
                                    self.showSignup = true
                                    self.showAlert = true
                                    self.isFocused = false
                                    self.hideKeyboard()
                                } ) {
                                    Text("Signup")
                                        .foregroundColor(.black)
                                }
                                .padding(12)
                                .padding(.horizontal, 30)
                                .background(Color("secondary"))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: Color("secondary").opacity(0.3), radius: 5, x: 0, y: 5)
                                .offset(x: showSignup ? -500 : 0)
                                //R alert
                                .alert(isPresented: $viewModel.showInputAlert) {
                                    Alert(title: Text("Important message"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
                            }

//                            .alert(isPresented: $showAlert) {
//                                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .padding(.trailing, 20)
     
                        HStack {
                            Spacer()
                            Text("Forgot Password?")
                                .font(.subheadline).bold()
                                .foregroundColor(Color("secondary"))
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 3.0)
                                .padding(.top, 10)
                        }
                        .padding(.trailing, 20)
                        .onTapGesture {
                            EmailHelper.shared.sendMail()
                        }
                        
                        
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .offset(y: bounds.size.height / 3)//(y: 350)
                }
                .offset(y: isFocused ? -300 : 0)
                .animation(.easeInOut)
                .onTapGesture {
                    self.isFocused = false  // when tap outside of email/pass frame the screen is going back to y=0
                    self.hideKeyboard()
                    self.showSignup = false
                }
            }
        }//.offset(y: viewModel.showHomeScreen ? -1000 : 0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//            .environment(\.colorScheme, .dark)
    }
}



//MARK:- SIGNUP VIEW

//VStack {
//    if showSignup {
//    HStack {
//        Image(systemName: "person.crop.circle.fill")
//            .foregroundColor(Color("secondary"))
//            .frame(width: 44, height: 44)
////                            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 5)
//            .padding(.leading)
//
//
//        TextField("".uppercased(), text: $name)
//            .placeholder(when: name.isEmpty){ // modifier for placeholder color
//                Text("name").foregroundColor(Color("secondary")).opacity(0.4)
//            }
//            .keyboardType(.default)
//            .font(.subheadline)
//            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.leading)
//            .frame(height: 44)
//            .onTapGesture {
//                self.isFocused = true
//            }
//    }
//    Divider()
//        .frame(height: 1)
//        .background(Color("secondary"))
//        .padding(.leading, 80)
//    }
//
//    HStack {
//        Image(systemName: "envelope")
//            .foregroundColor(Color("secondary"))
//            .frame(width: 44, height: 44)
////                            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 5)
//            .padding(.leading)
//
//
//        TextField("".uppercased(), text: $email)
//            .placeholder(when: email.isEmpty){
//                Text("email").foregroundColor(Color("secondary")).opacity(0.4)
//            }
//            .keyboardType(.emailAddress)
//            .font(.subheadline)
//            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.leading)
//            .frame(height: 44)
//            .onTapGesture {
//                self.isFocused = true
//            }
//    }
//
//    Divider()
//        .frame(height: 1)
//        .background(Color("secondary"))
//        .padding(.leading, 80)
//
//    HStack {
//        Image(systemName: "lock.fill")
//            .foregroundColor(Color("secondary"))
//            .frame(width: 44, height: 44)
////                            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 5)
//            .padding(.leading)
//
//        SecureField("".uppercased(), text: $password)
//            .placeholder(when: password.isEmpty){
//                Text("password").foregroundColor(Color("secondary")).opacity(0.4)
//            }
//            .keyboardType(.default)
//            .font(.subheadline)
//            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.leading)
//            .frame(height: 44)
//            .onTapGesture {
//                self.isFocused = true
//            }
//    }
//}



//MARK:- FIELD FOR LOGIN / BUTTONS WITH ALLERTS
//VStack {
//    HStack {
//        Text("Forgot Password?")
//            .font(.subheadline)
//            .foregroundColor(Color("secondary"))
//        Spacer()
//        Button(action: {
//            self.showAlert = true
//            self.isFocused = false
//            self.hideKeyboard()
//        } ) {
//            Text("Log in")
//                .foregroundColor(.black)
//        }
//        .padding(12)
//        .padding(.horizontal, 30)
//        .background(Color("secondary"))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: Color("secondary").opacity(0.3), radius: 10, x: 0, y: 10)
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//        }
//    }
//    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//    .padding()
//
//
//    HStack {
//        Text("Not registered?")
//            .font(.subheadline)
//            .foregroundColor(Color("secondary"))
//        Spacer()
//        Button(action: {
//            self.showSignup = true
//            self.showAlert = true
//            self.isFocused = false
//            self.hideKeyboard()
//        } ) {
//            Text("Signup")
//                .foregroundColor(.black)
//        }
//        .padding(12)
//        .padding(.horizontal, 30)
//        .background(Color("secondary"))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: Color("secondary").opacity(0.3), radius: 10, x: 0, y: 10)
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//        }
//    }
//    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//    .padding()
//
//}
