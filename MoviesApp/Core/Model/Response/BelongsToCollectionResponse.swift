//
//  BelongsToCollectionResponse.swift
//  MoviesApp
//
//  Created by rescalon on 2/7/24.
//

import Foundation

struct BelongsToCollectionResponse: Codable {
    let backdropPath: String?
    
    enum CodingKeys:String, CodingKey {
        case backdropPath = "backdrop_path"
    }
}

extension BelongsToCollectionResponse {
    func toDomain() -> BelongsToCollection {
        return BelongsToCollection(
            backdropPath: self.backdropPath
        )
    }
}
