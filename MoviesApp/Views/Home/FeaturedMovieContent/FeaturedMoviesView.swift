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
        ForEach(FeaturedMoviesSections.allCases, id: \.self) { section in
            HorizontalItemsContainerView(
                title: section.displayName,
                items: movies.filter { $0.section == section.rawValue },
                onMovieClicked: onMovieClicked
            )
        }
    }
}

#Preview {
    var movies:[Movie] = []
    for section in FeaturedMoviesSections.allCases {
        movies.append(contentsOf: PreviewDataProvider.instance.movies.filter { $0.section == section.rawValue })
    }
    
    return FeaturedMoviesView(
        movies: movies,
        onMovieClicked: { movie in }
    )
}
