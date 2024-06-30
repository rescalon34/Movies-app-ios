//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation

extension String {
    
    /// Construct image poster URL.
    func getImagePosterPath(_ width: String = DEFAULT_POSTER_WIDTH) -> String {
        BASE_IMAGE_URL + width + self
    }
    
    func getYoutubeVideoUrl() -> String {
        return BASE_YOUTUBE_URL + self
    }
    
    func getYoutubeVideoPreviewUrl() -> String {
        return BASE_EMBED_YOUTUBE_URL + self + HQ_DEFAULT_IMAGE
    }
    
    /// Converting releaseDate to a year format. E.g. 2024
    func formatReleaseDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = YEAR_MONTH_DAY_FORMAT
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        return "\(year)"
    }
    
    func formatReleaseYearAndMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = MONTH_FORMAT
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        let month = dateFormatter.string(from: date)
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        return "\(month) \(year)"
    }
    
    func formatPublishedAtDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ISO_8601_DATE_FORMAT
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        dateFormatter.dateFormat = FULL_DATE_FORMAT
        return dateFormatter.string(from: date)
    }
}
