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
    case getMovieGenres
    case getMovies(type: String)
    case getMoviesByGenre(genreId: Int)
    case getMovieDetails(movieId: Int)
    case getSuggestedMovies(movieId: Int)
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
        case .getMovieGenres:
            return "genre/movie/list"
        case .getMovies(type: let type):
            return "movie/\(type)"
        case .getMoviesByGenre:
            return "discover/movie"
        case .getMovieDetails(movieId: let movieId):
            return "movie/\(movieId)"
        case .getSuggestedMovies(movieId: let movieId):
            return "movie/\(movieId)/recommendations"
        }
    }
    
    // group all api calls by its HTTP method (get, put, post, delete, etc).
    var method: Moya.Method {
        switch self {
        case .getMovieGenres,
                .getMovies,
                .getMoviesByGenre,
                .getMovieDetails,
                .getSuggestedMovies:
            return .get
        }
    }
    
    // Add endpoints required parameters to fetch the data from the API.
    var task: Moya.Task {
        switch self {
        case .getMovieGenres,
                .getMovies,
                .getSuggestedMovies:
            return .requestParameters(
                parameters: [API_KEY: API_KEY_VALUE],
                encoding: URLEncoding.queryString
            )
        case .getMoviesByGenre(genreId: let genreId):
            return .requestParameters(
                parameters: [
                    API_KEY: API_KEY_VALUE,
                    "with_genres": genreId
                ],
                encoding: URLEncoding.queryString
            )
        case .getMovieDetails:
            return .requestParameters(
                parameters: [
                    API_KEY: API_KEY_VALUE,
                    "append_to_response": "videos",
                    "language": "en-US"
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    // All headers required by the endpoint.
    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}
