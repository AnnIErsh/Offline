//
//  NetworkConfiguration.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

class NetworkConfiguration {
    private let apiKey = "9f3b3102ab704b7c9a874ee92cdb288f"

    func getHeaders() -> [String: String] {
        return ["X-Api-Key": apiKey]
    }

    static func getBaseUrl() -> String {
        return "https://newsapi.org/v2/"
    }
}
