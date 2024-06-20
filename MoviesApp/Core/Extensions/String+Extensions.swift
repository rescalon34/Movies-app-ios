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
    
    func toUnicode() -> String {
        String(self)
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
}
