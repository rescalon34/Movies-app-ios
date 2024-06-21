//
//  GenreResponse.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import Foundation

struct GenreResponse: Codable {
    let id: Int
    let name: String
}

extension GenreResponse {
    func toDomain() -> Genre {
        return Genre(id: self.id, name: self.name)
    }
}
