//
//  AccountRepository.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation
import Moya

enum AccountAPI: TargetType {
    
    // Endpoints
    case getWatchlistMovies(accountId: Int)
}

extension AccountAPI {
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getWatchlistMovies(accountId: let accountId):
            return "account/\(accountId)/watchlist/movies"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWatchlistMovies:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getWatchlistMovies:
            return .requestParameters(
                parameters: ["": ""],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        [
            "Content-type": "application/json",
            AUTHORIZATION: "\(BEARER) \(ACCESS_TOKEN)"
        ]
    }
}
