//
//  SearchByKeywordResultsView.swift
//  MoviesApp
//
//  Created by rescalon on 6/7/24.
//

import SwiftUI

struct SearchByKeywordResultsView: View {
    
    // MARK: - Properties
    let keyword: String
    let moviesByKeyword: [Movie]
    let searchResultStatus: SearchResultStatus
    let searchSuggestions: [String]
    let onItemClick: (Movie) -> ()
    let onSuggestionClick: (String) -> ()
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            VStack(alignment: .leading) {
                if !moviesByKeyword.isEmpty {
                    movieResultsContent
                } else {
                    if searchResultStatus == .NOT_STARTED {
                        searchSuggestionsContent
                    } else {
                        ContentNotAvailableView(
                            title: "Oops! no results for \(keyword)",
                            description: "There is no result that matches your search. Please with a different keyword."
                        )
                    }
                }
            }
        }
    }
    
    // MARK: - main screen content
    @ViewBuilder
    private var movieResultsContent: some View {
        Text("Results")
            .font(.subheadline)
            .foregroundStyle(Color.customColors.secondaryTextColor)
            .bold()
            .padding(.horizontal)
        
        ScrollView {
            ForEach(moviesByKeyword) { movie in
                MoviePreviewItemView(
                    imageUrl: movie.imageUrl?.getImagePosterPath() ?? "",
                    title: movie.title,
                    overview: getOverview(movie: movie),
                    isVideoPreview: false,
                    onItemClick: {
                        onItemClick(movie)
                    }
                )
            }
        }
    }
    
    @ViewBuilder
    private var searchSuggestionsContent: some View {
        Text("Suggestions:")
            .foregroundStyle(Color.customColors.secondaryTextColor)
            .padding(.horizontal)
            .bold()
        
        List(searchSuggestions, id: \.self) { suggestion in
            Text(suggestion)
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                .onTapGesture {
                    onSuggestionClick(suggestion)
                }
        }
        .background(Color.customColors.backgroundColor)
        .listStyle(.plain)
    }
    
    // MARK: Functions
    private func getOverview(movie: Movie) -> String {
        let releasedOn = movie.releaseDate?.formatReleaseDate() ?? ""
        let language = movie.originalLanguage?.uppercased() ?? ""
        let delimiterKey = Constants.ASTERISK
        
        return language + delimiterKey + releasedOn
    }
}

// MARK: - Preview
#Preview {
    SearchByKeywordResultsView(
        keyword: "Inside out",
        moviesByKeyword: PreviewDataProvider.instance.movies,
        searchResultStatus: .NOT_STARTED,
        searchSuggestions: PreviewDataProvider.instance.movies.map { $0.title },
        onItemClick: { _ in },
        onSuggestionClick: { _ in }
    )
}
