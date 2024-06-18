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
    var movieTitle: String = ""
    @State private var contentOffset: CGFloat = 0
    @State private var showNavigationTitle = false
    @State private var isPlayerPresented = false
    
    init(movie: Movie?) {
        self.movie = movie
        movieTitle = movie?.title ?? ""
    }
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            ObservableScrollView(contentOffset: $contentOffset) {
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
            .navigationTitle(showNavigationTitle ? movieTitle : "")
            .navigationBarTitleDisplayMode(.inline)
            .showToolbarBackground(isVisible: showNavigationTitle)
            .toolbar { movieDetailsToolbarContent }
            .onChange(of: contentOffset, perform: onMinHeaderAppBarOffsetReached)
            .background(Color.customColors.secondaryBackgroundColor)
            .edgesIgnoringSafeArea(.top)
            .sheet(isPresented: $isPlayerPresented) {
                YouTubePlayerView(
                    title: movieTitle,
                    movieUrl: movie?.videoUrl
                )
            }
        }
    }
    
    // MARK: Toolbar
    @ToolbarContentBuilder
    var movieDetailsToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // TODO
            } label: {
                Image(systemName: "tv.badge.wifi")
                    .foregroundColor(.white)
            }
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // TODO
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
            imageUrl: movie?.imageUrl.getImagePosterPath(ORIGINAL_POSTER_WIDTH) ?? "",
            contentMode: .fill,
            width: .infinity,
            height: 380
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .translucentGradientMask()
        
        VStack(spacing: 0) {
            Text(movieTitle.uppercased())
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
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
            .onTapGesture {
                isPlayerPresented.toggle()
            }
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
        
        Text(movie?.overview ?? "")
            .font(.callout)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            .lineSpacing(4)
            .lineLimit(Int(Constants.THREE))
            .foregroundColor(Color.customColors.primaryClearTextColor)
    }
    
    /// View containing all details content,
    private var movieDetails: some View {
        VStack(alignment: .leading) {
            Text("DETAILS")
                .bold()
            
            Divider()
                .background(Color.customColors.dismissViewIconColor)
            
            Text(movieTitle)
                .font(.title3)
                .padding(.top)
                .bold()
            
            Text(movie?.overview ?? "")
                .font(.callout)
                .padding(.top, 4)
                .lineSpacing(5)
            
            Text(PreviewDataProvider.instance.mockMovieDescription)
                .font(.callout)
                .padding(.top, 4)
                .lineSpacing(5)
        }
        .foregroundColor(Color.customColors.primaryClearTextColor)
        .padding()
    }
    
    // Functions
    /// Show the navigationTitle background when the scrolling passes the
    /// image heigth.
    private func onMinHeaderAppBarOffsetReached(value: CGFloat) {
        withAnimation(.easeInOut) {
            showNavigationTitle = value < Constants.MIN_APP_BAR_DETAILS_OFFSET
        }
    }
}

// MARK: - Preview
#Preview {
    MovieDetailsScreenView(movie: PreviewDataProvider.instance.movie)
}
