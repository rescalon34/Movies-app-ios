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
}
