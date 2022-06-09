//
//  DetailScreen.swift
//  Offline
//
//  Created by Anna Ershova on 09.06.2022.
//

import SwiftUI

struct DetailScreen: View {
    @EnvironmentObject var newsModel: NewsViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(newsModel.saved?.articles ?? []) { i in
                    Text("\(i.title)")
                }
            }
            Button("Clear Data") {
                newsModel.clearCoreData()
            }
        }
        .padding()
    }
}
