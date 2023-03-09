//
//  Constants.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation

public enum CommonStringConstants {
    case newsFeedListTitle
    
    public var value: String {
        switch self {
        case .newsFeedListTitle:
            return "News Feed"
        }
    }
}

public enum CellIdentifiers {
    case newsFeedCellIdentifier
    
    public var value: String {
        switch self {
        case .newsFeedCellIdentifier:
            return "NewsFeedTableViewCell"
        }
    }
}

public enum URLBuilderComponents {
    case countryKey
    case apiKey
    case apiValue
    case baseUrl
    case topHeadLines
    
    public var value: String {
        switch self {
        case .countryKey:
            return "country"
        case .apiKey:
            return "apiKey"
        case .apiValue:
            return "c4d72f1d3bd54ba5a13dcb225a6f535d"
        case .baseUrl:
            return "newsapi.org"
        case .topHeadLines:
            return "/v2/top-headlines"
        }
    }
}

public enum Countries {
    case US
    case TR
    
    public var value: String {
        switch self {
        case .US:
            return "US"
        case .TR:
            return "TR"
        }
    }
}

public enum UrlScheme {
    case https
    
    public var value: String {
        switch self {
        case .https:
            return "https"
        }
    }
}
