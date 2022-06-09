//
//  NewsList.swift
//  Offline
//
//  Created by Anna Ershova on 09.06.2022.
//

import Foundation

struct NewsList: Codable {
    let articles: [NewsItem]
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
}
