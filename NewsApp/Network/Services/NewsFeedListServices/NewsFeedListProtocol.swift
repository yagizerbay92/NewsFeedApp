//
//  NewsFeedListProtocol.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 9.03.2023.
//

import Foundation

protocol NewsFeedListProtocol: AnyObject {
    func getNewsFeedList(completion: @escaping (Result<NewsFeedListModel, Error>) -> Void)
}
