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
    let belongsToCollection: BelongsToCollection?
    let genres: [Genre]?
    let videos: [Video]?
    let section: String?
    let originalLanguage: String?
    
    static var `default`: Self = .init(
        id: 0,
        title: "",
        imageUrl: "",
        releaseDate: "",
        runtime: 0,
        overview: "",
        belongsToCollection: BelongsToCollection(backdropPath: "mDMCET9Ens5ANvZAWRpluBsMAtS.jpg"),
        genres: [],
        videos: [],
        section: nil,
        originalLanguage: nil
    )
}
