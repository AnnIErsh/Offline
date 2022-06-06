//
//  NetworkService.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

protocol INetworkService {
    func request<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T, Error>) -> ())
}

class NetworkService: INetworkService {

    lazy var urlSession: URLSession = {
        return URLSession.shared
    }()
    
    func request<T>(type: T.Type, url: URL, completion: @escaping (Result<T, Error>) -> ()) where T: Decodable, T: Encodable {
        print("do your request")
        let request = URLRequest(url: url)
        let task = urlSession.dataTask(with: request) { data, _ , error in
            let res: Result<T, Error>
            if error != nil { res = .failure(error!) }
            else { res = .success(data as! T) }
            completion(res)
        }
        task.resume()
    }
}
