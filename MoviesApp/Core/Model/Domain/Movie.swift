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
    let imageUrl: String
    let overview: String
    let videos: [Video]?
    
    static var `default`: Self = .init(
        id: 0,
        title: "",
        imageUrl: "",
        overview: "",
        videos: []
    )
}
