//
//  SignInView.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct HomePage: View {
    @State private var selectedActivities: [String: Bool] = [
        "Hiking": false, "Water Activities": false, "Theme Parks": false,
        "Desserts": false, "Exotic Flavors": false,
        "SPA": false, "Movies": false, "Sceneries": false
    ]

    let categories: [String: [String]] = [
        "Outdoor Activities": ["Hiking", "Water Activities", "Theme Parks"],
        "Food Lovers": ["Desserts", "Exotic Flavors"],
        "Relaxation": ["SPA", "Movies", "Sceneries"]
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(categories.keys.sorted(), id: \.self) { category in
                    Text(category)
                        .font(.headline)
                        .padding(.top)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(categories[category]!, id: \.self) { activity in
                                Button(action: {
                                    selectedActivities[activity]?.toggle()
                                }) {
                                    Text(activity)
                                        .activityButtonStyle(isSelected: selectedActivities[activity] ?? false)
                                }
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                    .frame(height: 50)
                }

                Button("Get Recommendations", action: fetchRecommendations)
                    .buttonStyle()
                    .padding()
            }
            .padding(.horizontal)
        }
    }

    func fetchRecommendations() {
        // Fetch recommendations logic
        let selected = selectedActivities.filter { $0.value }.map { $0.key }
        print("Selected activities: \(selected)")
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
