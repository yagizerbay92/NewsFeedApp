//
//  Constants.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

public enum CommonStringConstants {
    case apiKey
    case baseUrl
    case topHeadLines
    
    public var value: String {
        switch self {
        case .apiKey:
            return "c4d72f1d3bd54ba5a13dcb225a6f535d"
        case .baseUrl:
            return "newsapi.org"
        case .topHeadLines:
            return "/v2/top-headlines"
        }
    }
}


