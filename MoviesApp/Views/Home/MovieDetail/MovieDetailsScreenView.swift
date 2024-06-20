//
//  MovieDetailsScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import SwiftUI

struct MovieDetailsScreenView: View {
    
    // MARK: - ViewModel
    @StateObject var viewModel: MovieDetailsViewModel = .init()
    
    // MARK: - Properties
    let movieId: Int?
    @State private var contentOffset: CGFloat = 0
    @State private var showNavigationTitle = false
    @State private var isPlayerPresented = false
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            VStack {
                movieDetailsContent(movie: viewModel.movie)
            }
        }
        .navigationTitle(showNavigationTitle ? viewModel.getMovieTitle() : "")
        .navigationBarTitleDisplayMode(.inline)
        .showToolbarBackground(isVisible: showNavigationTitle)
        .toolbar { movieDetailsToolbarContent }
        .onChange(of: contentOffset, perform: onMinHeaderAppBarOffsetReached)
        .sheet(isPresented: $isPlayerPresented) {
            YouTubePlayerView(
                title: viewModel.getMovieTitle(),
                videoKey: viewModel.getOfficialTrailerVideoKey()
            )
        }
        .onAppear {
            guard let id = movieId else { return }
            viewModel.getMovieDetails(movieId: id)
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
    @ViewBuilder
    private func movieDetailsContent(movie: Movie?) -> some View {
        // Show the proper content depending on the status.
        if viewModel.isLoading {
            ProgressView()
        } else {
            if let movie = movie,
               viewModel.errorMessage.isEmpty {
                scrollableDetailsContent(movie: movie)
            } else {
                // TODO: show proper error UI.
                Text(viewModel.errorMessage)
            }
        }
    }
    
    // This view represents the whole movie details scrollable content.
    private func scrollableDetailsContent(movie: Movie) -> some View {
        ObservableScrollView(contentOffset: $contentOffset) {
            VStack {
                movieDetailsHeader(movie: movie)
                playMovieButton
                movieDetailsOverview(movie: movie)
                movieDetails(movie: movie)
            }
            .padding(.bottom, 50)
        }
        .translucentGradientMask(
            repeating: Constants.EIGTH,
            startPoint: .bottom,
            endPoint: .top
        )
        .background(Color.customColors.secondaryBackgroundColor)
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - Views
    // Header Image, title and small overview.
    @ViewBuilder
    private func movieDetailsHeader(movie: Movie) -> some View {
        loadAsyncImage(
            imageUrl: movie.imageUrl.getImagePosterPath(ORIGINAL_POSTER_WIDTH),
            contentMode: .fill,
            width: .infinity,
            height: 380
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .translucentGradientMask()
        
        // Movie title
        VStack(spacing: 0) {
            Text(movie.title.uppercased())
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Movie ReleaseDate and Runtime
            HStack(spacing: 4) {
                Text(movie.releaseDate?.formatReleaseDate() ?? "")
                DotSeparatorView()
                Text(movie.runtime?.formatRuntime() ?? "")
                DotSeparatorView()
                Text(viewModel.getMovieGenres())
            }
            .padding(.top, 4)
            .padding(.horizontal)
            .lineLimit(1)
            .font(.footnote)
            .foregroundColor(Color.customColors.secondaryTextColor)
        }
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
    private func movieDetailsOverview(movie: Movie) -> some View {
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
        
        Text(movie.overview)
            .font(.callout)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            .lineSpacing(4)
            .lineLimit(Int(Constants.THREE))
            .foregroundColor(Color.customColors.primaryClearTextColor)
    }
    
    /// View containing all details content,
    private func movieDetails(movie: Movie) -> some View {
        VStack(alignment: .leading) {
            Text("DETAILS")
                .bold()
            
            Divider()
                .background(Color.customColors.dismissViewIconColor)
            
            Text(movie.title)
                .font(.title3)
                .padding(.top)
                .bold()
            
            Text(movie.overview)
                .font(.callout)
                .padding(.top, 4)
                .lineSpacing(5)
        }
        .foregroundColor(Color.customColors.primaryClearTextColor)
        .padding()
    }
    
    // MARK: - Functions
    
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
    MovieDetailsScreenView(movieId: 1022789)
}
