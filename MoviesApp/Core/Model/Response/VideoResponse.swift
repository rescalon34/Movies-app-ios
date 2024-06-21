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
    let key: String
    let type: String
}

extension VideoResponse {
    func toDomain() -> Video {
        return Video(key: self.key, type: self.type)
    }
}
