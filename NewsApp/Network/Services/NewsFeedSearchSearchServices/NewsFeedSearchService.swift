//
//  NewsFeedSearchService.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 14.03.2023.
//

import Foundation

import Foundation

class NewsFeedSearchService {
    static let shared = NewsFeedSearchService()
    private init() {}
    
    private func createUrl(queryString: String) -> URL? {
        let urlQuery: [URLQueryItem] = [URLQueryItem(name: URLBuilderComponents.queryKey.value, value: queryString),
                                        URLQueryItem(name: URLBuilderComponents.sortedByKey.value, value: URLBuilderComponents.sortedByValue.value),
                                        URLQueryItem(name: URLBuilderComponents.apiKey.value, value: URLBuilderComponents.apiValue.value)]
        
        return URLBuilder.buildURL(scheme: UrlScheme.https.value,
                                   host: URLBuilderComponents.baseUrl.value,
                                   queries: urlQuery,
                                   path: URLBuilderComponents.everything.value)
    }
}

extension NewsFeedSearchService: NewsFeedSearchProtocol  {
    func getNewsFeedSearchList(queryString: String,
                               completion: @escaping (Result<NewsFeedListModel, Error>) -> Void) {
        
        guard let url = createUrl(queryString: queryString) else { return }
        
        NetworkManager.shared.request(dataType: NewsFeedListModel.self,
                                      urlString: url,
                                      method: .get) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
