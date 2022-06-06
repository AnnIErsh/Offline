//
//  MainViewModel.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Injected var network: NetworkService?
    @Injected var parse: ParseJsonService?
    @Injected var data: DataService?
    let path: String = "top-headlines?language=en"
    
    var url: URL {
        URL(stringLiteral: "\(NetworkConfiguration.getBaseUrl())\(path)")
    }
    
    func doSomething() {
        network?.request(type: NewsList.self, url: url, completion: { res in
            print("res: ", res)
        })
        parse?.doParse()
        data?.saveData()
    }
}
