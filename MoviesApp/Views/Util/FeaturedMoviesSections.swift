//
//  FeaturedMoviesSections.swift
//  MoviesApp
//
//  Created by rescalon on 27/6/24.
//

import Foundation

enum FeaturedMoviesSections: String, CaseIterable {
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming = "upcoming"
    case popular = "popular"
    
    var displayName: String {
        switch self {
        case .nowPlaying: "Now Playing"
        case .topRated: "Top Rated"
        case .upcoming: "Upcoming"
        case .popular: "Popular"
        }
    }
}
