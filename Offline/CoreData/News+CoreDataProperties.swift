//
//  News+CoreDataProperties.swift
//  Offline
//
//  Created by Anna Ershova on 08.06.2022.
//
//

import Foundation
import CoreData


extension News {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var articles: Data?
}

extension News: Identifiable {
    
}
