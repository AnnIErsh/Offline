//
//  NewsItem.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

struct NewsItem: Codable, Identifiable {
    var id: String {
        return title
    }
    let title: String
    let author: String?
    let publishedAt: String
    var urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case publishedAt
        case urlToImage
    }
}

struct NewsList: Codable {
    
    let articles: [NewsItem]
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
}



