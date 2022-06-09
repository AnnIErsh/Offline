//
//  MainScreen.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var mainModel = MainViewModel()
    @ObservedObject var newsModel = NewsViewModel()
    
    var body: some View {
        VStack {
            Button("Load News") {
                mainModel.clealData()
                mainModel.fetchRequest()
            }
            List {
                ForEach(mainModel.saved?.articles ?? []) { i in
                    Text("\(i.title)")
                }
            }
            Button("Add News") {
                newsModel.addNews(newData: mainModel.saved!)
            }
        }
        .padding()
    }
}

