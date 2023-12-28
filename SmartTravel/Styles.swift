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

struct ActivityButtonStyle: ViewModifier {
    var isSelected: Bool
    var gradient: Gradient

    func body(content: Content) -> some View {
        content
            .foregroundColor(isSelected ? Color.white : Color.gray)
            .padding(.horizontal, 20)
            .padding()
            .background(backgroundView)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: isSelected ? 0 : 1)
            )
            .shadow(color: isSelected ? Color.black.opacity(0.2) : Color.clear, radius: 10, x: 0, y: 0)
            .transition(.scale)
    }

    private var backgroundView: some View {
        Group {
            if isSelected {
                AnyView(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            } else {
                AnyView(Color.white)
            }
        }
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
    func activityButtonStyle(isSelected: Bool, gradient: Gradient) -> some View {
        self.modifier(ActivityButtonStyle(isSelected: isSelected, gradient: gradient))
    }
}

// You can also define custom colors and other reusable properties
extension Color {
    static let customBlue = Color("CustomBlue") // Define this color in your asset catalog
}
