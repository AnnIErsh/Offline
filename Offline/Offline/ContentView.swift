//
//  ContentView.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var secected: Int = 0
    
    var body: some View {
        TabView(selection: $secected) {
            MainScreen()
                .tag(0)
                .tabItem {
                    Label("News", systemImage: "circle")
                }
            DetailScreen()
                .tag(1)
                .tabItem {
                    Label("CoreData", systemImage: "circle")
                }
        }
        .padding()
        .environmentObject(NewsViewModel())
    }
}
