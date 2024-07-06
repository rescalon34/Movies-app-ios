//
//  CollectionResponse.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation

struct CollectionResponse: Codable {
    let id: Int
    let backdropPath: String?
    let name: String?
    let posterPath: String?
    let movies: [MovieResponse]?
    
    enum CodingKeys:String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case name
        case posterPath = "poster_path"
        case movies = "parts"
    }
}

extension CollectionResponse {
    func toDomain() -> Collection {
        Collection(
            id: self.id,
            backdropPath: self.backdropPath,
            name: self.name,
            posterPath: self.posterPath,
            movies: self.movies.map { movieResponse in
                movieResponse.map { $0.toDomain() }
            },
            logo: "/hRYATYBMw0MGoVtl4EEsxzg87Kn.png"
        )
    }
}
