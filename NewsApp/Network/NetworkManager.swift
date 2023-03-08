//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

final class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
    
    private func createUrl() -> URL? {
        let urlQuery: [URLQueryItem] = [URLQueryItem(name: "country", value: "US"),
                                       URLQueryItem(name: "apiKey", value: CommonStringConstants.apiKey.value)]
        
        return URLBuilder.buildURL(scheme: "https",
                                   host: CommonStringConstants.baseUrl.value,
                                   queries: urlQuery,
                                   path: CommonStringConstants.topHeadLines.value)
    }
}

extension NetworkManager {
    public func getTopStroies(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = createUrl() else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let err = error {
                completion(.failure(err))
            }
            
            else if let customData = data {
                do {
                    let result = try JSONDecoder().decode(NewsFeedListModel.self, from: customData)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
