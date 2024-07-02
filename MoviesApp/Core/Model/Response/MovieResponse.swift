//
//  Movie.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import Foundation

struct MovieResponse: Identifiable, Codable {
    let id: Int
    let title: String
    let imageUrl: String?
    let releaseDate: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "poster_path"
        case releaseDate = "release_date"
        case overview
    }
}

extension MovieResponse {
    func toDomain(section: String? = nil) -> Movie {
        Movie(
            id: self.id,
            title: self.title,
            imageUrl: self.imageUrl,
            releaseDate: self.releaseDate,
            runtime: nil,
            overview: self.overview,
            belongsToCollection: nil,
            genres: nil,
            videos: nil,
            section: section
        )
    }
}
