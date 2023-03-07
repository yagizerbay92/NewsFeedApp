//
//  NewsFeedListModel.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

struct NewsFeedListModel: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
