//
//  NewsFeedListService.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 9.03.2023.
//

import Foundation

class NewsFeedListService: NewsFeedListProtocol {
    static let shared = NewsFeedListService()
    private init() {}
    
    private func createUrl() -> URL? {
        let urlQuery: [URLQueryItem] = [URLQueryItem(name: "country", value: "US"),
                                        URLQueryItem(name: "apiKey", value: CommonStringConstants.apiKey.value)]
        
        return URLBuilder.buildURL(scheme: "https",
                                   host: CommonStringConstants.baseUrl.value,
                                   queries: urlQuery,
                                   path: CommonStringConstants.topHeadLines.value)
    }
    
    func getNewsFeedList(completion: @escaping (Result<NewsFeedListModel, Error>) -> Void) {
        guard let url = createUrl() else {
            return
        }
        
        NetworkManager.shared.request(dataType: NewsFeedListModel.self, urlString: url, method: .get) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
