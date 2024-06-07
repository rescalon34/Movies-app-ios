//
//  PreviewProvider.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import Foundation
import SwiftUI

/*
 This class will be hosting all preview complex data objects with dummy data.
 */
class PreviewDataProvider {
    static let instance = PreviewDataProvider()
    private init() { }
    
    let movie = Movie(id: 1, title: "Ape Planet")
    
    let selectedCategory = "Comedy"
}
