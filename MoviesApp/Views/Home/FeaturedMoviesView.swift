//
//  FeaturedMoviesView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI

/// Featured movies screen content.
struct FeaturedMoviesView: View {
    
    // MARK: - Properties
    let movies: [Movie]
    let onMovieClicked: (Movie) -> ()
    
    // MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                featuredMoviesContent
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Views
    var featuredMoviesContent: some View {
        // TODO, should be iterated by category.
        ForEach(0..<6) { item in
            HorizontalItemsContainerView(
                title: "Recently Added",
                items: movies,
                onMovieClicked: onMovieClicked
            )
        }
    }
}

#Preview {
    FeaturedMoviesView(
        movies: PreviewDataProvider.instance.movies,
        onMovieClicked: { movie in }
    )
}
