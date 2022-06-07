//
//  MainViewModel.swift
//  Offline
//
//  Created by Anna Ershova on 05.06.2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Injected var network: NetworkService?
    @Injected var data: DataService?
    let path: String = "everything?q=tesla"
    
    var url: URL {
        URL(stringLiteral: "\(NetworkConfiguration.getBaseUrl())\(path)")
    }
    
    func fetchRequest() {
        DispatchQueue.global(qos: .utility).async { [self] in
            network?.request(type: NewsList.self, url: url, completion: { result in
                switch result {
                case .success(let data):
                    print(data as Any)
                case .failure(let error):
                    print("some error after parsing: ", error.localizedDescription)
                    return
                }
            })
        }
        data?.saveData()
    }
}


//func fetchRequest() {
//    DispatchQueue.global(qos: .utility).async { [self] in
//        network?.request(type: NewsList.self, url: url, completion: { result in
//            print("result: ", result)
//            switch result {
//            case .success(let data):
//                self.parsed?.parseJson(data: data, completion: { (res: NewsList?) in
//                    //
//                })
//            case .failure(let error):
//                print("some error after parsing: ", error.localizedDescription)
//                return
//            }
//            DispatchQueue.main.async {
//                let parsedresult = self.parsed?.saved
//                print("parsed results: ", parsedresult as Any)
//            }
//        })
//    }
//    data?.saveData()
//}
