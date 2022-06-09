//
//  MainViewModel.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Injected var network: NetworkService?
    @Published var saved: NewsList?
    
    var path: String = "everything?q=tesla"
    
    var url: URL {
        URL(stringLiteral: "\(NetworkConfiguration.getBaseUrl())\(path)")
    }
    
    func fetchRequest() {
        DispatchQueue.global(qos: .utility).async { [self] in
            network?.request(type: NewsList.self, url: url, completion: { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.saved = data
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("some error after parsing: ", error.localizedDescription)
                    }
                }
            })
        }
    }
    
    func clealData() {
        saved = nil
    }
}
