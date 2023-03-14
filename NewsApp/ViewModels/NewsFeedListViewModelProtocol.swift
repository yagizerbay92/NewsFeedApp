//
//  NewsFeedListViewModelProtocol.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 8.03.2023.
//

import Foundation

protocol NewsFeedListViewModelProtocol: AnyObject {
    func fetchTopStories()
    func subscribeListChange(with completion: @escaping NewsFeedCallback)
    func setImageData(with data: Data)
    func getImageData() -> Data
    func returnNewsFeedList() -> [Article]
    func returnNewsFeedListCount() -> Int
    func returnNewsFeedItem(index: Int) -> Article
    func fetchSearchedNewsList(queryString: String)
}
