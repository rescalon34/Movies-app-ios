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
    case getAccountState(movieId: Int)
    case getWatchlistMovies(accountId: Int)
    case addMovieToWatchlist(accountId: Int, request: AddMovieToWatchlistRequest)
}

extension AccountAPI {
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getAccountState(movieId: let movieId):
            return "movie/\(movieId)/account_states"
        case .getWatchlistMovies(accountId: let accountId):
            return "account/\(accountId)/watchlist/movies"
        case .addMovieToWatchlist(accountId: let accountId):
            return "account/\(accountId)/watchlist"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAccountState,
                .getWatchlistMovies:
            return .get
            
        case .addMovieToWatchlist:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAccountState,
                .getWatchlistMovies:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.queryString
            )
        case .addMovieToWatchlist(_, let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        [
            "Content-type": "application/json",
            AUTHORIZATION: "\(BEARER) \(ACCESS_TOKEN)"
        ]
    }
}
