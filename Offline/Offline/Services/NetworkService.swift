//
//  NetworkService.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation

protocol INetworkService {
    func request<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T?, Error>) -> Void)
}

class NetworkService: INetworkService {
    var configuration = NetworkConfiguration()
    let decoder = JSONDecoder()

    private lazy var urlSession: URLSession = {
        return URLSession.shared
    }()
    
    func request<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T?, Error>) -> Void) {
        print("do your request")
        var request = URLRequest(url: url)
        let headers = configuration.getHeaders()
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        let task = urlSession.dataTask(with: request) { [weak self] data, _, error in
            if let error = error { completion(.failure(error)) }
            else {
                if let data = data {
                    if let content = try? self?.decoder.decode(T.self, from: data) {
                        completion(.success(content))
                    }
                }
            }
        }
        task.resume()
    }
}
