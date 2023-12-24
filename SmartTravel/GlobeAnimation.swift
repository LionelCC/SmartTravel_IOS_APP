//
//  GlobeAnimation.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct GlobeAnimation: ViewModifier {
    @State private var animate = false

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: animate)
            .onAppear {
                animate = true
            }
            .fixedSize() 
    }
}

extension View {
    func rotatingGlobeAnimation() -> some View {
        self.modifier(GlobeAnimation())
    }
}

