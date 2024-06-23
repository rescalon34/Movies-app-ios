//
//  Movie.swift
//  MoviesApp
//
//  Created by rescalon on 18/6/24.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let imageUrl: String?
    let releaseDate: String?
    let runtime: Int?
    let overview: String
    let genres: [Genre]?
    let videos: [Video]?
    
    static var `default`: Self = .init(
        id: 0,
        title: "",
        imageUrl: "",
        releaseDate: "",
        runtime: 0,
        overview: "",
        genres: [],
        videos: []
    )
}
