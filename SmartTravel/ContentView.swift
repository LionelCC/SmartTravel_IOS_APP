import SwiftUI

struct ContentView: View {
    private let locations = ["Paris", "Tokyo", "Hawaii", "Dubai", "Sydney"]
    @State private var currentLocationIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Combined Text for Title and Scrolling Locations
                HStack {
                    Text("Smart Trip to ")
                        .titleStyle() // Using the custom style for title
                    Text(locations[currentLocationIndex])
                        .titleStyle() // Using the same custom style
                        .foregroundColor(.blue)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                                withAnimation {
                                    currentLocationIndex = (currentLocationIndex + 1) % locations.count
                                }
                            }
                        }
                }

                Spacer()

                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                        .buttonStyle() // Applying the custom button style
                }

                Spacer()
            }
            .navigationTitle("Welcome")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
