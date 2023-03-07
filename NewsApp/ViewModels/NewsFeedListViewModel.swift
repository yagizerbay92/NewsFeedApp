//
//  NewsFeedListViewModel.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

class NewsFeedViewModel {
    public init() {}
    
    public func getTopStories() {
        NetworkManager.shared.getTopStroies { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}
