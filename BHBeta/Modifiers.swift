//
//  Extensions.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/9/21.
//

import SwiftUI

struct UserProfile: ViewModifier {
    var showUserProfile: Bool
    var viewState: CGSize

    func body(content: Content) -> some View {
        content
        .offset(y: showUserProfile ? -450 :0)
        .rotation3DEffect(Angle(degrees: showUserProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
        .scaleEffect(showUserProfile ? 0.9 : 1)
    }
}


