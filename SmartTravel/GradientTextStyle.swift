//
//  GradientTextStyle.swift
//  SmartTravel
//  Created by Lionel Chen on 12/23/23.
//


import SwiftUI

struct GradientTextStyle: ViewModifier {
    let gradients: [Gradient] = [
        Gradient(colors: [.blue, .purple]),
        Gradient(colors: [.green, .yellow]),
        Gradient(colors: [.orange, .red]),
        Gradient(colors: [.yellow, .orange]),
        Gradient(colors: [.purple, .orange]),
        Gradient(colors: [.white, .blue]),
        Gradient(colors: [.green, .white]),
    ]

    let index: Int

    func body(content: Content) -> some View {
        content
            .foregroundStyle(LinearGradient(gradient: gradients[index % gradients.count], startPoint: .leading, endPoint: .trailing))
    }
}

extension View {
    func gradientTextStyle(index: Int) -> some View {
        modifier(GradientTextStyle(index: index))
    }
}
