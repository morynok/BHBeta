//
//  TeamViewDetail.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/7/21.
//

import SwiftUI

struct TeamViewDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //    let screen = UIScreen.main.bounds
    var team: Team
    
    var body: some View {

        VStack(alignment: .center) {

            HStack(alignment: .center) {
                TeamView(team: team)
            }.frame(maxWidth: .infinity)
//     
                ZStack{
                    BackCardView()
                        .frame(width: 340, height: 220)
                        .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .offset(x: 0, y: -30)
                        .rotationEffect(Angle(degrees: 5))
                    
                    CardView(team: team)
                        .frame(width: 340, height: 240)
                        .background(Color.black.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 20)
                        .blendMode(.hardLight)
                    
                    
                }
                .frame(height: 300)
                .offset(y: 70)
                BottomImage()
                .rotationEffect(Angle(degrees: -15))

        }
        .frame(maxHeight: screen.height - 30)
        .background(BackgroundView())
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            })
            { Image(systemName: "x.circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color.black.opacity(0.5))
            }
                .accentColor(.black)
                .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 2)
        )
     
        
    }
}

struct TeamViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamViewDetail(team: teamData[2])
    }
}


//MARK:- CARD VIEW DETAIL

struct CardView: View {
    var team: Team
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("card")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(team.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("TeamMemberSubtitle")
                    
                    Text(team.description)
                }
                .foregroundColor(.white)
                //                Spacer()
            }
            .padding()
        }
    }
}

//MARK:- BACKCARD VIEW DETAIL

struct BackCardView: View {
    var body: some View {
        VStack{
            //            Spacer()
        }
    }
}

struct BottomImage: View {
    var body: some View {
        VStack{
            Image("dare")
                .resizable()
                .aspectRatio(contentMode: .fit)
            //            Spacer()
        }
    }
}
