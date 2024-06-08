//
//  GridMoviesByCategoryView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI

struct GridMoviesByCategoryView: View {
    
    // MARK: - Properties
    let category: String
    let movies: [Movie]
    private let flexible = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(category)
                    .bold()
                gridMoviesContent
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Views
    private var gridMoviesContent: some View {
        LazyVGrid(columns: flexible, spacing: 10) {
            ForEach(movies) { movie in
                MovieItemView(imageUrl: movie.imageUrl)
            }
        }
    }
}

#Preview {
    GridMoviesByCategoryView(
        category: "Horror",
        movies: PreviewDataProvider.instance.movies
    )
}
