//
//  AddMovieToWatchlistResponse.swift
//  MoviesApp
//
//  Created by rescalon on 1/7/24.
//

import Foundation

struct AddMovieToWatchlistResponse: Codable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys:String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
