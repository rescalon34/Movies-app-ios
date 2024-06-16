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
    
    let mockMovieDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    let movies : [Movie] = [
        Movie(id: 1, title: "Kindom of the Planet of the Apes", imageUrl: "https://media.themoviedb.org/t/p/original/gKkl37BQuKTanygYQG1pyYgLVgf.jpg"),
        Movie(id: 2, title: "Civil War", imageUrl: "https://media.themoviedb.org/t/p/original/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg"),
        Movie(id: 3, title: "Godzila*Kong", imageUrl: "https://media.themoviedb.org/t/p/original/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg"),
        Movie(id: 4, title: "TAROT", imageUrl: "https://media.themoviedb.org/t/p/original/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg"),
        Movie(id: 5, title: "Atlas", imageUrl: "https://media.themoviedb.org/t/p/original/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg"),
        Movie(id: 6, title: "The Fall Guy", imageUrl: "https://media.themoviedb.org/t/p/original/tSz1qsmSJon0rqjHBxXZmrotuse.jpg"),
        Movie(id: 7, title: "Bad Boys: Ride or Die", imageUrl: "https://media.themoviedb.org/t/p/original/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg"),
        Movie(id: 8, title: "The First Omen", imageUrl: "https://media.themoviedb.org/t/p/original/uGyiewQnDHPuiHN9V4k2t9QBPnh.jpg"),
        Movie(id: 9, title: "Godzilla Minus One", imageUrl: "https://media.themoviedb.org/t/p/original/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"),
        Movie(id: 10, title: "Inside Out 2", imageUrl: "https://media.themoviedb.org/t/p/original/t7bhjraXuN4hd3yZVBVVhP3BdX0.jpg"),
    ]
    
    let selectedCategory = "Comedy"
    
    let profileImage = "https://i.pinimg.com/originals/fe/7e/33/fe7e3350a9834b31d6b6138ae3f9e712.png"
    
    let profiles: [Profile] = [
        .init(
            id: 1,
            name: "Robert",
            imageUrl: "https://i.pinimg.com/originals/fe/7e/33/fe7e3350a9834b31d6b6138ae3f9e712.png",
            isSelected: true,
            colors: [.yellow, .orange, .black]
        ),
        .init(
            id: 2,
            name: "Yeti",
            imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8c498b2b-fcd8-4558-9a63-d96873c7274a/dg0fbbw-cd3c8776-e6b8-4432-a32c-3d52a7d0ca98.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzhjNDk4YjJiLWZjZDgtNDU1OC05YTYzLWQ5Njg3M2M3Mjc0YVwvZGcwZmJidy1jZDNjODc3Ni1lNmI4LTQ0MzItYTMyYy0zZDUyYTdkMGNhOTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bFn5v-qzdkchbWQkxGJbg7ac1bJrHHBlGeB39-ZgQs0",
            isSelected: false,
            colors: [.yellow, .blue.opacity(0.5), .black]
        )
    ]
}
