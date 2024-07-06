//
//  CollectionKeywords.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation

enum CollectionKeywords: String, CaseIterable {
    case collections = "Collections"
    case starwars = "Star wars"
    case horror = "Horror"
    case comedy = "Comedy"
    case romance = "Romance"
    case jurasiccPark = "Jurassic Park"
    case comics = "Comics"
    case documentary = "Documentary"
    
    static func getRandomKeyword() -> String {
        CollectionKeywords.allCases.randomElement()?.rawValue ?? ""
    }
    
    static func getLogoByCollection(collectionName: String) -> String {
        let logo = switch collectionName {
        case CollectionKeywords.starwars.rawValue: "/hRYATYBMw0MGoVtl4EEsxzg87Kn.png"
        case CollectionKeywords.horror.rawValue: "/1GEdwlz6EGCVmAvXBF36OB7bMo7.png"
        case CollectionKeywords.comedy.rawValue: "/akjwGHYHzLyHoBXRoIUdZdUyVSi.png"
        case CollectionKeywords.romance.rawValue: "/6PzC1O1QRoSiM6sReQ4ZHuW9lkB.png"
        case CollectionKeywords.jurasiccPark.rawValue: "/ut0M6al21x1SfgZj9bxz9ZiUrPn.png"
        case CollectionKeywords.comics.rawValue: "/r0jQoCK0oQ2bRQC99WTZxgTe6qB.png"
        case CollectionKeywords.documentary.rawValue: "/uBz2Dj3sUFQQJrX9njI9MgEwvd8.png"
        default: "/kyE83l2648IXArRQOOQJlirQ76b.png"
        }
        return logo
    }
}
