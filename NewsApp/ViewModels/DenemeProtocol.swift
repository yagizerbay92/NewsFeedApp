//
//  DenemeProtocol.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 8.03.2023.
//

import Foundation

protocol DenemeProtocol {
    func getTopStories()
    func subscribeListChange(with completion: @escaping NewsFeedCallback)
    func setImageData(with data: Data)
    func getImageData() -> Data
    func returnNewsFeedList() -> [Article]
    func returnNewsFeedListCount() -> Int
}
