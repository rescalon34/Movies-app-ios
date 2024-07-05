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
    
    enum CodingKeys:String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case name
        case posterPath = "poster_path"
    }
}

extension CollectionResponse {
    func toDomain() -> Collection {
        Collection(
            id: self.id,
            backdropPath: self.backdropPath,
            name: self.name,
            posterPath: self.posterPath,
            logo: nil
        )
    }
}
