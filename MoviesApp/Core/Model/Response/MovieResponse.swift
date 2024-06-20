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
    let imageUrl: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "poster_path"
        case overview
    }
}

extension MovieResponse {
    func toDomain() -> Movie {
        Movie(
            id: self.id,
            title: self.title,
            imageUrl: self.imageUrl,
            releaseDate: nil,
            runtime: nil,
            overview: self.overview,
            genres: nil,
            videos: nil
        )
    }
}
