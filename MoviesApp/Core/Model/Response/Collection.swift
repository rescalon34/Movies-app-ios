//
//  Collection.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation

struct Collection: Identifiable {
    let id: Int
    let backdropPath: String?
    let name: String?
    let posterPath: String?
    let movies: [Movie]?
    let logo: String?
}
