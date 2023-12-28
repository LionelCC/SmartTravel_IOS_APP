//
//  Config.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/24/23.
//

import Foundation

struct Config {
    static var openAIKey: String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let value = plist.object(forKey: "OpenAI_API_Key") as? String else {
            fatalError("Couldn't find key 'OpenAI_API_Key' in 'Config.plist'.")
        }
        return value
    }
}

