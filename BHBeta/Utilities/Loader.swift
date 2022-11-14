//
//  Loader.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    var text: String?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                content()
                    .disabled(isShowing)
                    .blur(radius: isShowing ? 2 : 0)
                
                if isShowing {
                    Rectangle()
                        .fill(Color.black).opacity(isShowing ? 0.6 : 0)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 30) {
                        ProgressView().scaleEffect(2.0, anchor: .center)
                        Text(text ?? "Loading...").font(.title3).fontWeight(.light)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color.white)
                    .foregroundColor(Color.primary)
                    .cornerRadius(16)
                }
            }
        }
    }
}


