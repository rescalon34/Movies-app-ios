//
//  SearchRepository.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation
import Moya

enum SearchAPI: TargetType {
    case getTrendingMovies(timeWindow: String)
    case getCollection(keyword: String)
}

extension SearchAPI {
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getTrendingMovies(timeWindow: let timeWindow):
            return "trending/movie/\(timeWindow)"
        case .getCollection:
            return "search/collection"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTrendingMovies,
                .getCollection:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTrendingMovies:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.queryString
            )
        case .getCollection(keyword: let keyword):
            return .requestParameters(
                parameters: ["query" : keyword],
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
