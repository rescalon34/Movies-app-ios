//
//  Movie.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let overview: String
    let videoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "poster_path"
        case overview
        case videoUrl = "backdrop_path" // for testing
    }
}
