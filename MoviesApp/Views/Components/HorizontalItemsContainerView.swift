//
//  HorizontalItemsContainerView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI


/// This view is inteneded to be reused on those screen that display scrollable
/// items horizontally within a given category.
struct HorizontalItemsContainerView: View {
    
    // MARK: - Properties
    let title: String
    let items: [Movie]
    let onMovieClicked: (Movie) -> ()
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color.customColors.secondaryTextColor)
                .bold()
            
            // Show the right movie item view scroll content depending on the display name.
            if title == FeaturedMoviesSections.nowPlaying.displayName {
                nowPlayingHorizontalContent
            } else {
                otherSectionsHorizontalContent
            }
        }
    }
    
    // MARK: - View functions
    private var nowPlayingHorizontalContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items) { item in
                    NowPlayingMovieItemView(
                        title: item.title,
                        imageUrl: item.imageUrl ?? "",
                        releaseDate: getNowPlayingtMovieOverview(item)
                    )
                    .frame(width: 230)
                    .onTapGesture {
                        onMovieClicked(item)
                    }
                }
            }
        }
    }
    
    private var otherSectionsHorizontalContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items) { item in
                    MovieItemView(
                        imageUrl: item.imageUrl?.getImagePosterPath() ?? ""
                    )
                    .onTapGesture {
                        onMovieClicked(item)
                    }
                }
            }
        }
    }
    
    private func getNowPlayingtMovieOverview(_ movie: Movie) -> String {
        let date = movie.releaseDate?.formatReleaseYearAndMonth() ?? ""        
        return "Released on: \(date)"
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        ScrollView {
            VStack(spacing: 16) {
                HorizontalItemsContainerView(
                    title: "Now Playing",
                    items: PreviewDataProvider.instance.movies
                ) { _ in }
                HorizontalItemsContainerView(
                    title: "Top Rated",
                    items: PreviewDataProvider.instance.movies
                ) { _ in }
            }
            .padding()
        }
    }
}
