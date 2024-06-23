//
//  SuggestedMoviesSegmentContentView.swift
//  MoviesApp
//
//  Created by rescalon on 22/6/24.
//

import SwiftUI

struct SuggestedMoviesSegmentContentView: View {
    
    // MARK: - Properties
    let movies: [Movie]
    let onMovieClicked: (Movie) -> Void
    
    // MARK: Body
    var body: some View {
        LazyVGridMoviesView(
            movies: movies,
            movieItemSize: CGSize(width: 110, height: 250),
            lazyVGridColumns: Int(Constants.TWO),
            lazyVGridSpacing: (Constants.TEN, Constants.TEN),
            onMovieClicked: onMovieClicked
        )
    }
}

// MARK: Preview
#Preview {
    ScrollView {
        SuggestedMoviesSegmentContentView(
            movies: PreviewDataProvider.instance.movies,
            onMovieClicked: { _ in }
        )
    }
}
