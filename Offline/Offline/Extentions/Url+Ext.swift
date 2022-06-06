//
//  Url+Ext.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(string: "\(value)")!
    }
}
