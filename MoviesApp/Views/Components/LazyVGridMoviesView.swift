//
//  LazyVGridMoviesView.swift
//  MoviesApp
//
//  Created by rescalon on 22/6/24.
//

import SwiftUI

/// A reusable LazyVGrid view container for displaying a list of movies in a grid layout.
///
/// This view takes an array of `Movie` objects and displays them in a grid using
/// a specified number of flexible columns.
///
/// Each movie item can be customized with a specified size and the action to
/// perform when the movie is clicked.
///
struct LazyVGridMoviesView: View {
    // MARK: - Properties
    let movies: [Movie]
    let movieItemSize: CGSize
    var imageResolution: String = DEFAULT_POSTER_WIDTH
    let lazyVGridColumns: Int
    let lazyVGridSpacing: LazyVGridSpacing
    let onMovieClicked: (Movie) -> Void
    
    // MARK: Body
    var body: some View {
        gridMoviesContent
    }
    
    // MARK: - Views
    private var gridMoviesContent: some View {
        LazyVGrid(
            columns: getFlexibleGridColumns(lazyVGridColumns, lazyVGridSpacing.horizontal),
            spacing: lazyVGridSpacing.vertical
        ) {
            ForEach(movies) { movie in
                MovieItemView(
                    imageUrl: movie.imageUrl?.getImagePosterPath(imageResolution) ?? "",
                    movieItemSize: movieItemSize
                ).onTapGesture {
                    onMovieClicked(movie)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ScrollView {
        LazyVGridMoviesView(
            movies: PreviewDataProvider.instance.movies,
            movieItemSize: CGSize(width: 160, height: 250),
            lazyVGridColumns: 2,
            lazyVGridSpacing: (10, 10),
            onMovieClicked: { _ in }
        )
    }
}
