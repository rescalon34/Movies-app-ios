//
//  WatchlistMoviesDataResponse.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation

struct WatchlistMoviesDataResponse: Codable {
    let page: Int
    let results: [MovieResponse]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}
