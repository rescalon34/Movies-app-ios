//
//  MovieDetailsScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import SwiftUI

struct MovieDetailsScreenView: View {
    
    // MARK: - Properties
    let movie: Movie?
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            ScrollView(showsIndicators: false) {
                VStack {
                    movieDetailsHeader
                    playMovieButton
                    movieDetailsOverview
                    movieDetails
                }
                .padding(.bottom, 50)
            }
            .translucentGradientMask(
                repeating: Constants.EIGTH,
                startPoint: .bottom,
                endPoint: .top
            )
            .toolbar { movieDetailsToolbarContent }
            .background(Color.customColors.secondaryBackgroundColor)
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    // MARK: Toolbar
    @ToolbarContentBuilder
    var movieDetailsToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // todo
            } label: {
                Image(systemName: "tv.badge.wifi")
                    .foregroundColor(.white)
            }
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // todo
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.white)
            }
        }
    }
    
    // MARK: - Views
    /// Header Image, title and small overview.
    @ViewBuilder
    private var movieDetailsHeader: some View {
        loadAsyncImage(
            imageUrl: movie?.imageUrl ?? "",
            contentMode: .fill,
            width: .infinity,
            height: 380
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .translucentGradientMask()
        
        VStack(spacing: 0) {
            Text(movie?.title.uppercased() ?? "")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("2023 - 2h 22m - Science Fiction, Comedy")
                .font(.footnote)
                .padding(.top, 4)
                .lineLimit(1)
                .foregroundColor(Color.customColors.secondaryTextColor)
        }
        .padding(.horizontal)
    }
    
    private var playMovieButton: some View {
        Label("PLAY", systemImage: "play.fill")
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.customColors.accentColor)
            .foregroundColor(Color.customColors.backgroundColor)
            .bold()
            .font(.callout)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal)
            .padding(.top)
    }
    
    // This view hosts the Horizontal action buttons and movie overview.
    @ViewBuilder
    private var movieDetailsOverview: some View {
        HStack(spacing: 0) {
            VerticalButtonWithTextView(
                icon: "plus.circle",
                text: "Watchlist",
                onButtonClick: {}
            )
            VerticalButtonWithTextView(
                icon: "arrow.down.to.line.circle.fill",
                text: "Download",
                onButtonClick: {}
            )
        }
        
        Text("An original musical about the joy and pain of pursuing dreams in a city known for crushing them.")
            .font(.callout)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading)
            .lineSpacing(8)
            .foregroundColor(Color.customColors.primaryClearTextColor)
    }
    
    /// View containing all details content,
    private var movieDetails: some View {
        VStack(alignment: .leading) {
            Text("DETAILS")
                .bold()
            
            Divider()
                .background(Color.customColors.dismissViewIconColor)
            
            Text(movie?.title ?? "")
                .font(.title3)
                .padding(.top)
                .bold()
            
            Text(PreviewDataProvider.instance.mockMovieDescription)
                .font(.callout)
                .padding(.top, 4)
                .lineSpacing(5)
        }
        .foregroundColor(Color.customColors.primaryClearTextColor)
        .padding()
    }
}

// MARK: - Preview
#Preview {
    MovieDetailsScreenView(movie: PreviewDataProvider.instance.movie)
}
