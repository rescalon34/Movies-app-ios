//
//  GenresDataResponse.swift
//  MoviesApp
//
//  Created by rescalon on 24/6/24.
//

import Foundation

struct GenresDataResponse: Decodable {
    let genres: [GenreResponse]
    
    enum CodingKeys:String, CodingKey {
        case genres = "genres"
    }
}
