//
//  MovieDetailSegmentOptions.swift
//  MoviesApp
//
//  Created by rescalon on 20/6/24.
//

import SwiftUI

/// Contains all Segments options from the footer content of the Movie Details screen.
enum MovieDetailSegmentOptions: CaseIterable {
    case Suggested
    case Clip
    case Detail
    
    var option: String {
        switch self {
        case .Suggested:
            "Suggested"
        case .Clip:
            "Clips"
        case .Detail:
            "Details"
        }
    }
}
