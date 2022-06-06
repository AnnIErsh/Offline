//
//  OfflineApp.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import SwiftUI

@main
struct OfflineApp: App {
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
