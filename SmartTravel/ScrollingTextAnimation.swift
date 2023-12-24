//
//  ScrollingTextAnimation.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct ScrollingTextAnimation: View {
    let locations: [String]
    let animationDuration: Double
    @State private var currentLocationIndex = 0

    var body: some View {
        VStack {
            Text(locations[currentLocationIndex])
                .font(.system(size: 26))
                .fontWeight(.bold)
                .gradientTextStyle(index: currentLocationIndex) // Use with just the index
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                .id(currentLocationIndex)
        }
        .frame(height: 35)
        .clipped()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                withAnimation {
                    currentLocationIndex = (currentLocationIndex + 1) % locations.count
                }
            }
        }
    }
}

