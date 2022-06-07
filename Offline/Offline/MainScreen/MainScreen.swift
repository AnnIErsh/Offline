//
//  MainScreen.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var model = MainViewModel()
    
    var body: some View {
        VStack {
            Button("Load News") {
                model.fetchRequest()
            }
            List {
                
            }
        }
        .padding()
    }
}

