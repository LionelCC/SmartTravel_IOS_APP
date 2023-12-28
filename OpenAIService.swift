//
//  OpenAIService.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/24/23.
//

import Foundation

class OpenAIService {
    private let apiKey: String
    private let session: URLSession

    init(apiKey: String, session: URLSession = .shared) {
        self.apiKey = apiKey
        self.session = session
    }

    func fetchCompletion(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "https://api.openai.com/v1/engines/davinci/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody: [String: Any] = ["prompt": prompt, "max_tokens": 60]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)

        session.dataTask(with: request) { data, response, error in
            // Handle response...
        }.resume()
    }
}
