//
//  MovieDetailSegmentOptions.swift
//  MoviesApp
//
//  Created by rescalon on 20/6/24.
//

import SwiftUI

/// Contains all Segments options from the footer content of the Movie Details screen.
enum MovieDetailSegmentOptions: CaseIterable {
    case Detail
    case Clip
    case Suggested
    
    var option: String {
        switch self {
        case .Detail:
            "Details"
        case .Clip:
            "Clips"
        case .Suggested:
            "Suggested"
        }
    }
}
