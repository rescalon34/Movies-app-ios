//
//  PreviewProvider.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import Foundation
import SwiftUI

/// This class will be hosting all preview complex data objects with dummy data.
class PreviewDataProvider {
    static let instance = PreviewDataProvider()
    private init() { }
    
    let movieFilters = [
        "Featured",
        "Recently Released",
        "All Movies",
        "Science Fiction",
        "Action and Adventure",
        "Biographies",
        "Comedy",
        "Crime",
        "Drama",
        "Documentaries",
        "30 of 30",
        "Horror",
        "Thriller",
        "Music",
        "Romance"
    ]
    
    let movie = Movie(id: 1, title: "Kindom of the Planet of the Apes", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
    
    let movies : [Movie] = [
        Movie(id: 1, title: "Kindom of the Planet of the Apes", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/gKkl37BQuKTanygYQG1pyYgLVgf.jpg"),
        Movie(id: 2, title: "Civil War", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg"),
        Movie(id: 3, title: "Godzila*Kong", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg"),
        Movie(id: 4, title: "TAROT", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg"),
        Movie(id: 5, title: "Atlas", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg"),
        Movie(id: 6, title: "The Fall Guy", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/tSz1qsmSJon0rqjHBxXZmrotuse.jpg"),
        Movie(id: 7, title: "Bad Boys: Ride or Die", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg"),
        Movie(id: 8, title: "The First Omen", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/uGyiewQnDHPuiHN9V4k2t9QBPnh.jpg"),
        Movie(id: 9, title: "Godzilla Minus One", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"),
        Movie(id: 10, title: "Inside Out 2", imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"),
    ]
    
    let selectedCategory = "Comedy"
}
