//
//  Styles.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 50)
            .padding()
            .background(Color(#colorLiteral(red: 0.498, green: 0.878, blue: 0.839, alpha: 1)))
            .cornerRadius(46)
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
            // .contentShape(Rectangle()) // Remove this line
    }
}



// Define a style for the title text
struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

// Extending View to include these modifiers for easy usage
extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonStyle())
    }

    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }
}

// You can also define custom colors and other reusable properties
extension Color {
    static let customBlue = Color("CustomBlue") // Define this color in your asset catalog
}
