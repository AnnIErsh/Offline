//
//  DetailScreen.swift
//  Offline
//
//  Created by Anna Ershova on 09.06.2022.
//

import SwiftUI

struct DetailScreen: View {
    @EnvironmentObject var newsViewModel: NewsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(newsViewModel.saved?.articles ?? []) { i in
                    Text("\(i.title)")
                }
            }
            .onAppear {
                newsViewModel.getNews()
            }
        }
        .padding()
    }
}
