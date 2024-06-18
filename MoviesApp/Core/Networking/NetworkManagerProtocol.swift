//
//  NetworkManagerProtocol.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation
import Moya

/// Network Manager logic to fetch Movies DATA from the API
protocol NetworManagerProtocol {
    var provider: MoyaProvider<MoviesAPI> { get }
    
    func getMovies(type: String, completion: @escaping (Result<MovieResponse, Error>) -> Void)
}

class NetworkManager: NetworManagerProtocol {
    
    var provider: Moya.MoyaProvider<MoviesAPI> = .init(plugins: [NetworkLoggerPlugin()])
    
    func getMovies(type: String, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        request(target: .getMovies(type: type), completion: completion)
    }
}

private extension NetworkManager {
    
    private func request<T: Decodable>(target: MoviesAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let dataResult = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(dataResult))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
