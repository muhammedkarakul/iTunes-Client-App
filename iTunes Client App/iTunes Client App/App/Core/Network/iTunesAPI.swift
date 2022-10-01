//
//  iTunesAPI.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import Foundation

final class iTunesAPI {
    static let shared = iTunesAPI()
    
    private let baseURL: URL = URL(string: "https://itunes.apple.com/search")!
    
    func fetchPodcasts(completion: @escaping (PodcastResponse?, Error?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let url = baseURL.appending(queryItems: [URLQueryItem(name: "term", value: "podcast")])
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                return
            }
            let podcastResponse = try? JSONDecoder().decode(PodcastResponse.self, from: data)
            completion(podcastResponse, nil)
        }
        dataTask.resume()
    }
}
