//
//  NewsFeedListViewModel.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

public typealias NewsFeedCallback = (() -> Void)

class NewsFeedViewModel {
    private var imageData: Data?
    private var newsFeedList: [Article]? {
        didSet {
            articleListSet?()
        }
    }
    private var articleListSet: NewsFeedCallback?
    public init() {}
    
    public func getTopStories() {
        NetworkManager.shared.getTopStroies { [weak self] result in
            switch result {
            case .success(let articles):
                self?.newsFeedList = articles
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func subscribeListChange(with completion: @escaping NewsFeedCallback) {
        articleListSet = completion
    }
    
    public func returnNewsFeedList() -> [Article] {
        return newsFeedList ?? []
    }
    
    public func setImageData(with data: Data) {
        self.imageData = data
    }
    
    public func getImageData() -> Data {
        return self.imageData ?? Data()
    }
}
