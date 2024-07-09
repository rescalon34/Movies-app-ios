//
//  AddMovieToWatchlistRequest.swift
//  MoviesApp
//
//  Created by rescalon on 1/7/24.
//

import Foundation

struct AddMovieToWatchlistRequest: Codable {
    let mediaType: String
    let mediaId: Int
    let watchlist: Bool
    
    enum CodingKeys:String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case watchlist
    }
}
