//
//  ServiceManager.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    private init() {}
    
    func fetchResponse<T: Decodable>(of type: T.Type = T.self,
                                     from url: String,
                                     with completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, resp, err in
            if let err = err {
                completionHandler(.failure(.badRequest(err)))
                return
            }
            
            guard let resp = resp as? HTTPURLResponse else {
                completionHandler(.failure(.badResponse))
                return
            }
            
            guard let data = data, resp.statusCode == 200 else {
                completionHandler(.failure(.badDataNilOrResponseNotOk))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                completionHandler(.success(decodedData))
            } catch let err {
                completionHandler(.failure(.badParse(err)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case badURL
    case badRequest(Error?)
    case badResponse
    case badDataNilOrResponseNotOk
    case badParse(Error?)
}
