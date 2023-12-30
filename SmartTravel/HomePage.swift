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

    let gradients: [Gradient] = [
        Gradient(colors: [.blue, .purple]),
        Gradient(colors: [.green, .yellow]),
        Gradient(colors: [.orange, .red]),
        // Add more gradients as needed
    ]
    
    let activityRecommendations: [String: [String]] = [
        "Hiking": ["Visit the Rocky Mountains", "Explore Yosemite National Park"],
        "Swimming": ["Enjoy the beaches of Hawaii", "Relax at the Maldives"],
        "Theme Parks": ["Experience Disneyland", "Adventure in Universal Studios"],
        "SPA": ["Prestige Spa", "Thai Spa experience"],
        // Add more mappings
    ]


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(Array(categories.keys.enumerated()), id: \.offset) { index, category in
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
                                        .activityButtonStyle(isSelected: selectedActivities[activity] ?? false, gradient: gradients[index % gradients.count])
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
            let selected = selectedActivities.filter { $0.value }.map { $0.key }
            var recommendations: [String] = []

            for activity in selected {
                if let recs = activityRecommendations[activity] {
                    recommendations.append(contentsOf: recs)
                }
            }

            // Present the recommendations
            // This could be updating a state variable to display on the UI,
            // navigating to a new view, or using a modal/alert.
            print("Recommendations: \(recommendations)")
        }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
