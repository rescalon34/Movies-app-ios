//
//  Video.swift
//  MoviesApp
//
//  Created by rescalon on 18/6/24.
//

import Foundation

struct VideoDataResponse: Codable {
    let results: [VideoResponse]
}

struct VideoResponse: Codable {
    let id: String
    let name: String
    let key: String
    let type: String
    let language: String
    let countryCode: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case key
        case type
        case language = "iso_639_1"
        case countryCode = "iso_3166_1"
        case publishedAt = "published_at"
    }
}

extension VideoResponse {
    func toDomain() -> Video {
        return Video(
            id: self.id,
            name: self.name,
            key: self.key,
            type: self.type,
            language: self.language,
            countryCode: self.countryCode,
            publishedAt: self.publishedAt
        )
    }
}
