//
//  NewsFeedListService.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 9.03.2023.
//

import Foundation

class NewsFeedListService {
    static let shared = NewsFeedListService()
    private init() {}
    
    private func createUrl() -> URL? {
        let urlQuery: [URLQueryItem] = [URLQueryItem(name: URLBuilderComponents.countryKey.value, value: Countries.US.value),
                                        URLQueryItem(name: URLBuilderComponents.apiKey.value, value: URLBuilderComponents.apiValue.value)]
        
        return URLBuilder.buildURL(scheme: UrlScheme.https.value,
                                   host: URLBuilderComponents.baseUrl.value,
                                   queries: urlQuery,
                                   path: URLBuilderComponents.topHeadLines.value)
    }
}

extension NewsFeedListService: NewsFeedListProtocol {
    func getNewsFeedList(completion: @escaping (Result<NewsFeedListModel, Error>) -> Void) {
        guard let url = createUrl() else { return }
        
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
