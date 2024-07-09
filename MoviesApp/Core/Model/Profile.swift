//
//  Profile.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import Foundation
import SwiftUI

struct Profile: Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let isSelected: Bool
    let colors: [Color]?
    
    init(id: Int, name: String, imageUrl: String, isSelected: Bool, colors: [Color]?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.isSelected = isSelected
        self.colors = colors
    }
}
