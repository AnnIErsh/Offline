//
//  ContentView.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = MainViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                self.model.doSomething()
            }
    }
}
