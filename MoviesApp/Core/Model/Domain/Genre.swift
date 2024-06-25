//
//  Genres.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import Foundation

struct Genre: Identifiable {
    let id: Int
    let name: String
    
    // Default "Featured Genre"
    static var `default`: Self = .init(id: UUID().hashValue, name: LocalMovieGenres.Featured.rawValue)
}
