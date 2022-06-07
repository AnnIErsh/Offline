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
                model.clealData()
                model.fetchRequest()
            }
            List {
                ForEach(model.saved?.articles ?? []) { i in
                    Text("\(i.title)")
                }
            }
        }
        .padding()
    }
}

