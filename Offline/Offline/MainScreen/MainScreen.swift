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
            HStack {
                Button("Load Tesla News") {
                    mainModel.clealData()
                    mainModel.path = "everything?q=tesla"
                    mainModel.fetchRequest()
                }
                Spacer()
                Button("Load Apple News") {
                    mainModel.clealData()
                    mainModel.path = "everything?q=apple"
                    mainModel.fetchRequest()
                }
        
            }
            List {
                ForEach(mainModel.saved?.articles ?? []) { i in
                    Text("\(i.title)")
                }
            }
            Button("Save") {
                newsModel.addNews(newData: mainModel.saved)
            }
        }
        .padding()
    }
}

