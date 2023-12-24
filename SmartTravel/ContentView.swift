//
//  ContentView.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    private let locations = ["Paris", "Tokyo", "Hawaii", "Dubai", "Sydney"]

    var body: some View {
        NavigationView {
            VStack {
                // "Welcome" text with flexible positioning
                ZStack(alignment: .top) {
                    Text("Welcome")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(y: -30) // Adjust vertical position as needed
                        .foregroundColor(.secondary) // Optional for visual distinction

                    // "Smart Trip to" text and scrolling animation
                    VStack {
                        Text("Smart Trip to")
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)

                        ScrollingTextAnimation(locations: locations, animationDuration: 2)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }

                // Sign in button
                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                        .buttonStyle()
                        .offset(y: 170)
                }
            }
        }
        .navigationBarHidden(true)// Keep a placeholder for layout

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
