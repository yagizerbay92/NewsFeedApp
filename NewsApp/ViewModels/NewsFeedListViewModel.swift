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
    
    private func getTopStories() {
        NewsFeedListService.shared.getNewsFeedList { [weak self] result in
            switch result {
            case .success(let success):
                self?.newsFeedList = success.articles
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getSearchedNewsList(queryString: String) {
        NewsFeedSearchService.shared.getNewsFeedSearchList(queryString: queryString) { [weak self] result in
            switch result {
            case .success(let success):
                self?.newsFeedList = success.articles
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension NewsFeedViewModel: NewsFeedListViewModelProtocol {
    func subscribeListChange(with completion: @escaping NewsFeedCallback) {
        articleListSet = completion
    }
    
    func returnNewsFeedList() -> [Article] {
        return newsFeedList ?? []
    }
    
    func setImageData(with data: Data) {
        self.imageData = data
    }
    
    func getImageData() -> Data {
        return self.imageData ?? Data()
    }
    
    func returnNewsFeedListCount() -> Int {
        return newsFeedList?.count ?? 0
    }
    
    func returnNewsFeedItem(index: Int) -> Article {
        return newsFeedList?[index] ?? Article(source: Source(name: ""),
                                               title: "",
                                               description: "",
                                               url: "",
                                               urlToImage: "",
                                               publishedAt: "")
    }
    
    func fetchTopStories() {
        getTopStories()
    }
    
    func fetchSearchedNewsList(queryString: String) {
        getSearchedNewsList(queryString: queryString)
    }
}
