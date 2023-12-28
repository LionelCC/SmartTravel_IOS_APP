//
//  FlowLayoutView.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/28/23.
//

import SwiftUI

struct FlowLayoutView: View {
    let items: [String]
    let itemHeight: CGFloat
    @Binding var selectedItems: [String: Bool]
    private let horizontalSpacing: CGFloat = 10
    private let verticalSpacing: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        
        return VStack(alignment: .leading, spacing: verticalSpacing) {
            ForEach(items, id: \.self) { item in
                itemButton(for: item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading) { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= lastHeight
                        }
                        lastHeight = d.height
                        let result = width
                        width -= d.width + horizontalSpacing
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        if item == items.last {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }

    private func itemButton(for item: String) -> some View {
        Button(action: {
            selectedItems[item]?.toggle()
        }) {
            Text(item)
                .activityButtonStyle(isSelected: selectedItems[item] ?? false)
        }
    }
}
