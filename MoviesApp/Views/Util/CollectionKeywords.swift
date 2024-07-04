//
//  CollectionKeywords.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation

enum CollectionKeywords: String, CaseIterable {
    case collections = "Collections"
    case starwards = "Star wars"
    case horror = "Horror"
    case comedy = "Comedy"
    case romance = "Romance"
    case jurasiccPark = "Jurassic Park"
    case comics = "Comics"
    case documentary = "Documentary"
    
    static func getRandomKeyword() -> String {
        CollectionKeywords.allCases.randomElement()?.rawValue ?? ""
    }
}
