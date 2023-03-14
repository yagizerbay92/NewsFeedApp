//
//  NewsFeedSearchProtocol.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 14.03.2023.
//

import Foundation

protocol NewsFeedSearchProtocol: AnyObject {
    func getNewsFeedSearchList(queryString: String,
                               completion: @escaping (Result<NewsFeedListModel, Error>) -> Void)
}
