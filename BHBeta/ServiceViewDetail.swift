//
//  ServiceViewDetail.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/7/21.
//

import SwiftUI

struct ServiceViewDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var service: BHService
    
    // extract service code from Service
    func extractCodeLetter() -> String {
        var serviceCode = ""
        serviceCode = service.serviceCode
        return serviceCode
    }
    
    // return staff names acc with specific service
    var names: [String] {
        let code = extractCodeLetter()
        return getCode(serviceCode: code)
    }
    
    var body: some View {
        VStack {
            Image(service.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 20)
            
            Divider().padding(.vertical, 5)
            
            VStack {
                HStack(alignment: .center) {
                    ForEach(names, id: \.self) { name in
                        Image(name)
                            .renderingMode(.original)
                            .resizable()
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.5))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0.0, y: 10)
                            .frame(width: 80, height: 80)
                            .padding(.horizontal, 10)
                    }
                }.frame(maxWidth: .infinity)
                
                Divider().padding(.vertical, 5)
            }
            
            ScrollView {
                    VStack {
                        Group {
                            VStack(alignment: .leading, spacing: 30) {
                                ForEach(service.details.indices, id: \.self) { index in
                                    VStack(spacing: 10) {
                                        Text(service.details[index].name)
                                            .font(Font.custom("Quentin", size: 40))
                                            .foregroundColor(Color(#colorLiteral(red: 0.7529411765, green: 0.6039215686, blue: 0.3568627451, alpha: 1)))
                                            .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                                            .frame(maxWidth: .infinity, alignment: .center)
                            
                                        Group {
                                            HStack(alignment: .top) {
                                                Image(systemName: "note.text")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                                                    .padding(5)

                                                Text(service.details[index].description)
                                                    .font(.body)
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                                            }.frame(maxWidth: .infinity, alignment: .leading)
                                        }

                                        Group {
                                            HStack {
                                                Image(systemName: "clock.arrow.circlepath")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                                                    .padding(5)

                                                Text(service.details[index].duration)
                                                    .font(.body)
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                                            }.frame(maxWidth: .infinity, alignment: .leading)
                                        }

                                        Group {
                                            HStack {
                                                Image(systemName: "dollarsign.circle")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)
                                                    .padding(5)

                                                Text(service.details[index].price)
                                                    .font(.body)
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }

                                        Divider().padding(.leading, 20).padding(.trailing, 20)
                                    }
                                }


                            }
                            .padding(.trailing, 30)
                            .padding(.leading, 30)
                            .padding(.bottom, 30)
                        }

                        Spacer()
                    }
//                    .navigationBarItems(
//                        trailing: Button(action: {
//                            self.presentationMode.wrappedValue.dismiss()
//
//                        })
//                            { Image(systemName: "x.circle")
//                            .font(.system(size: 20))
//                            .foregroundColor(Color.white.opacity(0.5))
//                        }
//                        .accentColor(.black)
//                        .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 2)
//                    )
                }
        }
        .edgesIgnoringSafeArea(.all)
        .background(BackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            })
            { Image(systemName: "x.circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color.white.opacity(0.5))
            }
                .accentColor(.black)
                .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 2)
        )
        }
    }

struct ServiceViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ServiceViewDetail(service: serviceData[0])
    }
}
