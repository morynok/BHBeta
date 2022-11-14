//
//  ContentView.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/6/21.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State var index = 0
//    @State var showLoading = false
//    @State var keyboardHeight: CGFloat = 0.0
//
//    @ObservedObject var viewModel = ProfileViewModel()
//
//    var body: some View {
//        LoadingView(isShowing:$viewModel.showLoader){
//            ZStack {
//                VStack{
//                    Image("bh")
//                        .resizable()
//                        .frame(width: 300, height: 200)
//                        .background(Color.clear)
//                        .padding()
//                    
//                    
//
//                    if self.index == 0 {
//
//                        Login(viewModel: viewModel)
//                    }
//                    else{
//                        SignUp(viewModel: viewModel)
//                    }
//                    
//                    HStack{
//                        Button(action: {  self.index = 0 }) {
//                            Text("Login")
//                                .foregroundColor(.white)//)self.index == 0 ? .black : .white)
//                                .fontWeight(.bold)
//                                .padding(.vertical, 10)
//                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
//
//                        }
//                        .background(Color.black.opacity(0.4))
//                        .foregroundColor(.white)
//                        .clipShape(Capsule())
//
//                        Button(action: { self.index = 1 }) {
//                            Text("Sign Up")
//                                .foregroundColor(.white)//self.index == 1 ? .black : .white)
//                                .fontWeight(.bold)
//                                .padding(.vertical, 10)
//                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
//                        }
//                        .background(Color.black.opacity(0.4))
//                        .foregroundColor(.white)
//                        .clipShape(Capsule())
//                    }
//                    .background(Color.black.opacity(0.1))
//                    .clipShape(Capsule())
//                    .padding(.top, 25)
//
//                }
//                .padding()
//
//
//            }
//            .background(BackgroundView())
//            .padding(.bottom,self.keyboardHeight)
//        }
//        .alert(isPresented: $viewModel.showInputAlert) {
//            Alert(title: Text("Important message"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
//        }
//        .fullScreenCover(isPresented: $viewModel.showHomeScreen) {
//            HomeScreen()
//        }
//        .offset(y: self.keyboardHeight)
//       // padding(.bottom,self.keyboardHeight)
//        .animation(.spring())
//        .onAppear{
//            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
//                guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
//                    return
//                }
//                let curFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//                let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//                    let deltaY = targetFrame.origin.y - curFrame.origin.y
//                self.keyboardHeight = deltaY//keyboardFrame.height
//            }
//            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
//                self.keyboardHeight = 0
//            }
//        }
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//
//struct Login : View {
//
//    @ObservedObject var viewModel: ProfileViewModel
//
//    var body : some View{
//        ZStack{
//            VStack{
//                VStack{
//                    TextInputField(sfSymbolName: Application.imagesConstant.person, placeHolder: "First Name", prompt: "Enter Valid name", field: $viewModel.firstName)
//                    
//                    Divider()
//                        .frame(height: 1)
//                        .background(Color("secondary"))
//                        .padding(.leading, 20)
//                    
//                    TextInputField(sfSymbolName: Application.imagesConstant.phone, placeHolder: "Mobile number with country code", prompt: "Enter Valid name", field: $viewModel.phone).textContentType(.telephoneNumber)
//                    
//                    Divider()
//                        .frame(height: 1)
//                        .background(Color("secondary"))
//                        .padding(.leading, 20)
//                    
//                    TextInputField(sfSymbolName: Application.imagesConstant.email, placeHolder: "Email", prompt: "Enter Valid name", field: $viewModel.email).textContentType(.emailAddress)
//
//                }
//                .padding(.vertical)
//                .padding(.horizontal, 20)
//                .padding(.bottom, 40)
//                .background(Color.black.opacity(0.4))
//                .foregroundColor(.black)
//                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                .padding(.top, 25)
//               
//                Button(action: {
//                    viewModel.login()
//                }) {
//
//                    Text("LOGIN")
//                        .foregroundColor(.white)
//                        .fontWeight(.bold)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 100)
//
//                }
//                .background(Color("primary"))
//                .cornerRadius(8)
//                .offset(y: -40)
//                .padding(.bottom, -40)
//                .shadow(radius: 15)
//
//
//            }
//        }
//    }
//
//}
//
//struct SignUp : View {
//
//    @ObservedObject var viewModel: ProfileViewModel
//
//    var body : some View{
//
//        VStack{
//            VStack{
//
//                TextInputField(sfSymbolName: Application.imagesConstant.person, placeHolder: "First Name", prompt: "Enter Valid name", field: $viewModel.firstName)
//
//                Divider()
//                    .frame(height: 1)
//                    .background(Color("secondary"))
//                    .padding(.leading, 20)
//                
//                TextInputField(sfSymbolName: Application.imagesConstant.phone, placeHolder: "Mobile number with country code", prompt: "Enter Valid name", field: $viewModel.phone).textContentType(.telephoneNumber)
//
//
//                Divider()
//                    .frame(height: 1)
//                    .background(Color("secondary"))
//                    .padding(.leading, 20)
//
//                TextInputField(sfSymbolName: Application.imagesConstant.email, placeHolder: "Email", prompt: "Enter Valid name", field: $viewModel.email).textContentType(.emailAddress)
//
//                Divider()
//                    .frame(height: 1)
//                    .background(Color("secondary"))
//                    .padding(.leading, 20)
//
//                TextInputField(sfSymbolName: Application.imagesConstant.address, placeHolder: "Address", prompt: "Enter Valid name", field: $viewModel.address).textContentType(.emailAddress)
//
//            }
//            .padding(.vertical)
//            .padding(.horizontal, 20)
//            .padding(.bottom, 40)
//            .background(Color.black.opacity(0.4))
//            .cornerRadius(10)
//            .padding(.top, 25)
//
//
//            Button(action: {
//                viewModel.signup()
//            }) {
//
//                Text("SIGNUP")
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .padding(.vertical)
//                    .frame(width: UIScreen.main.bounds.width - 100)
//
//            }
//            .background(Color("primary"))
//            .cornerRadius(8)
//            .offset(y: -40)
//            .padding(.bottom, -40)
//            .shadow(radius: 15)
//        }
//    }
//}

