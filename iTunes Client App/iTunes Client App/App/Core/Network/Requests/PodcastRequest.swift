//
//  PodcastRequest.swift
//  ArabamAssignment
//
//  Created by Muhammed Karakul on 11.01.2022.
//

import Foundation

struct PodcastRequest: DataRequest {
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": "Podcast"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> PodcastResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(PodcastResponse.self, from: data)
        return response
    }
}
