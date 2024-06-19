//
//  MovieDetailResponse.swift
//  MoviesApp
//
//  Created by rescalon on 18/6/24.
//

import Foundation

struct MovieDetailResponse: Identifiable, Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let overview: String
    let videos: VideoDataResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "poster_path"
        case overview
        case videos = "videos"
    }
}

extension MovieDetailResponse {
    func toDomain() -> Movie {
        return Movie(
            id: self.id,
            title: self.title,
            imageUrl: self.imageUrl,
            overview: self.overview,
            videos: self.videos.results.isEmpty ? nil : self.videos.results.map { video in
                video.toDomain()
            }
        )
    }
}
