//
//  SignInView.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/23/23.
//

import SwiftUI

struct HomePage: View {
    let openAIService = OpenAIService(apiKey: Config.openAIKey)

    var body: some View {
        VStack {
            Text("Home Page")
        }
        .onAppear {
            testOpenAIAPI()
        }
    }

    func testOpenAIAPI() {
        let testPrompt = "Translate the following English text to French: 'Hello, how are you?'"
        openAIService.fetchCompletion(prompt: testPrompt) { result in
            switch result {
            case .success(let response):
                print("OpenAI Response: \(response)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
