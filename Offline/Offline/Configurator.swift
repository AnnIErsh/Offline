//
//  Configurator.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
        ServiceLocator.shared.addServices(service: ParseJsonService())
        ServiceLocator.shared.addServices(service: DataService())
    }
}
