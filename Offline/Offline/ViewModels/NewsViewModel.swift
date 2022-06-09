//
//  NewsViewModel.swift
//  Offline
//
//  Created by Anna Ershova on 09.06.2022.
//

import Foundation
import CoreData

final class NewsViewModel: ObservableObject {
    @Injected private var data: DataService?
    @Published var saved: NewsList?
    
    func addNews(newData: NewsList?) {
        let news = News(context: (data?.context)!)
        news.articles = data?.encodeData(type: NewsList.self, withData: newData)
        data?.saveData()
        print("news added")
    }
    
    func getNews() {
        let requests = News.fetchRequest()
        var mapped: NewsList?
        do {
            let news = try data?.context?.fetch(requests) ?? []
            for i in news {
                let dec = data?.decodeData(type: NewsList.self, withData: i.articles)
                mapped = dec
                print("get News from data")
            }
        }
        catch {
            print("error getting news")
        }
        data?.saveData()
        DispatchQueue.main.async {
            self.saved = mapped
        }
    }
}
