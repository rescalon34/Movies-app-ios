//
//  Genres.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import Foundation

struct Genre: Identifiable, Equatable {
    let id: Int
    let name: String
    
    // Default "Featured Genre"
    static var `default`: Self = .init(id: UUID().hashValue, name: LocalMovieGenres.Featured.rawValue)
    
    /// Comparing the `left-hand-side` and `right-hand-side` genre instance types to meet the Equatable protocol.
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
