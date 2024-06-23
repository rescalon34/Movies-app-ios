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
    let onMovieClicked: (Movie) -> Void
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .bold()
            gridMoviesContent
        }
        .padding(.horizontal)
    }
    
    // MARK: - Views
    private var gridMoviesContent: some View {
        LazyVGridMoviesView(
            movies: movies,
            movieItemSize: CGSize(width: 110, height: 160),
            lazyVGridColumns: Int(Constants.THREE),
            lazyVGridSpacing: (Constants.TEN, Constants.TEN),
            onMovieClicked: onMovieClicked
        )
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        ScrollView {
            GridMoviesByCategoryView(
                category: "Horror",
                movies: PreviewDataProvider.instance.movies,
                onMovieClicked: { movie in }
            )
        }
    }
}
