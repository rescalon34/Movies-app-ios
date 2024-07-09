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

/// This NetworkManager class handles all network requests using Moya + Combine.
class NetworkManager {
    
    // Moya provider to make api requests. Using <MultiTarget> to pass any generic API target
    // like: <MoviesAPI>, <ProfileAPI>, etc.
    private let provider: MoyaProvider<MultiTarget> = .init(plugins: [NetworkLoggerPlugin()])
}

extension NetworkManager {
    
    /// A Reusable function to make network requests and return the result with combine.
    ///
    /// - Parameters:
    ///   - T: Any DataModel object that conforms to the Codable protocol.
    ///   - target: This function receives a TargetType, so we can pass any API endpoint for reusability.
    ///   - Returns: A publisher that emits a Result<T> with the decoded response/error.
    ///
    func requestPublisher<T: Decodable>(target: TargetType) -> AnyPublisher<Result<T, Error>, Never> {
        provider.requestPublisher(MultiTarget(target))
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
