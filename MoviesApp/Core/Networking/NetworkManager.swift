//
//  NetworkManagerProtocol.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation
import Moya
import Combine
import CombineMoya

class NetworkManager {
    
    var provider: Moya.MoyaProvider<MoviesAPI> = .init(plugins: [NetworkLoggerPlugin()])
    
    func getMovies(type: String) -> AnyPublisher<Result<MovieResponse, Error>, Never> {
        self.requestPublisher(target: .getMovies(type: type))
    }
}

private extension NetworkManager {
    
    private func requestPublisher<T: Decodable>(target: MoviesAPI) -> AnyPublisher<Result<T, Error>, Never> {
        provider.requestPublisher(target)
            .map { response in
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    return .success(result)
                } catch let error {
                    return .failure(error)
                }
            }
            .catch { error in
                Just(.failure(error))
            }
            .eraseToAnyPublisher()
    }
}
