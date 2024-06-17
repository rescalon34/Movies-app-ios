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
    
    let movie = Movie(
        id: 1,
        title: "Kindom of the Planet of the Apes",
        imageUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone."
    )
    
    let mockMovieDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." + "\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    
    let movies : [Movie] = [
        Movie(
            id: 1,
            title: "Kindom of the Planet of the Apes",
            imageUrl: "https://media.themoviedb.org/t/p/original/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
            overview: "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike."
        ),
        Movie(
            id: 2,
            title: "Civil War",
            imageUrl: "https://media.themoviedb.org/t/p/original/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
            overview: "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war."
        ),
        Movie(
            id: 3,
            title: "Godzila*Kong",
            imageUrl: "https://media.themoviedb.org/t/p/original/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg",
            overview: "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own."
        ),
        Movie(
            id: 4,
            title: "TAROT",
            imageUrl: "https://media.themoviedb.org/t/p/original/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg",
            overview: ""
        ),
        Movie(
            id: 5,
            title: "Atlas",
            imageUrl: "https://media.themoviedb.org/t/p/original/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg",
            overview: "When a group of friends recklessly violate the sacred rule of Tarot readings, they unknowingly unleash an unspeakable evil trapped within the cursed cards. One by one, they come face to face with fate and end up in a race against death."
        ),
        Movie(
            id: 6,
            title:
                "The Fall Guy",
            imageUrl: "https://media.themoviedb.org/t/p/original/tSz1qsmSJon0rqjHBxXZmrotuse.jpg",
            overview: "Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job."
        ),
        Movie(
            id: 7,
            title: "Bad Boys: Ride or Die",
            imageUrl: "https://media.themoviedb.org/t/p/original/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
            overview: "After their late former Captain is framed, Lowrey and Burnett try to clear his name, only to end up on the run themselves."
        ),
        Movie(
            id: 8,
            title: "The First Omen",
            imageUrl: "https://media.themoviedb.org/t/p/original/uGyiewQnDHPuiHN9V4k2t9QBPnh.jpg",
            overview: "When a young American woman is sent to Rome to begin a life of service to the church, she encounters a darkness that causes her to question her own faith and uncovers a terrifying conspiracy that hopes to bring about the birth of evil incarnate."
        ),
        Movie(
            id: 9,
            title: "Godzilla Minus One",
            imageUrl: "https://media.themoviedb.org/t/p/original/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
            overview: "In postwar Japan, Godzilla brings new devastation to an already scorched landscape. With no military intervention or government help in sight, the survivors must join together in the face of despair and fight back against an unrelenting horror."
        ),
        Movie(
            id: 10,
            title: "Inside Out 2",
            imageUrl: "https://media.themoviedb.org/t/p/original/t7bhjraXuN4hd3yZVBVVhP3BdX0.jpg",
            overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone."
        ),
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
