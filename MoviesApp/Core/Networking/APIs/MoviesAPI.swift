//
//  API.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation
import Moya

/// A file that hosts the API calls for Movies.
///
/// This file hosts the endpoints to fetch Movie list and its details.
///
enum MoviesAPI: TargetType {
    // Endpoints
    case getMovies(type: String)
}

extension MoviesAPI {
    
    // the BASE API from the server where the data is hosted.
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else { fatalError() }
        return url
    }
    
    // path appended after the base URL, some endpoints contain dynamic values.
    var path: String {
        switch self {
        case .getMovies(type: let type):
            return "movie/\(type)"
        }
    }
    
    // group all api calls by its HTTP method (get, put, post, delete, etc).
    var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    // Add endpoints required parameters to fetch the data from the API.
    var task: Moya.Task {
        switch self {
        case .getMovies:
            return .requestParameters(
                parameters: [API_KEY: API_KEY_VALUE],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    // All headers required by the endpoint.
    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}
