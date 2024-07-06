//
//  SearchCollectionDetailView.swift
//  MoviesApp
//
//  Created by rescalon on 4/7/24.
//

import SwiftUI

struct SearchCollectionDetailView: View {
    
    // MARK: - ViewModel
    @StateObject var viewModel: SearchCollectionDetailViewModel
    
    // MARK: - Properties
    let collection: Collection?
    let mainLogoUrl: String
    
    // MARK: - State properties
    @State private var contentOffset: CGFloat = 0
    @State var selectedMovie: Movie? = nil
    
    init(collection: Collection?, mainLogoUrl: String) {
        self.collection = collection
        self.mainLogoUrl = mainLogoUrl
        _viewModel = StateObject(wrappedValue: SearchCollectionDetailViewModel(collection: collection))
    }
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            ZStack {
                GeometryReader { geometry in
                    mainPosterImage(geometry)
                    mainCollectionLogo(geometry: geometry)
                    scrollableCollectionContent(geometry: geometry)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .background(Color.black)
        }
        .toolbar { homeToolbarContent }
        .navigationBarTitleDisplayMode(.inline)
        .showToolbarBackground(isVisible: viewModel.showToolbarBackground)
        .onChange(of: contentOffset, perform: onScrollViewContentOffsetChange)
        .navigationDestination(isPresented: $selectedMovie.toBinding()) {
            MovieDetailsScreenView(movieId: selectedMovie?.id, isAddedToWatchlist: .constant(false))
        }
    }
    
    // MARK: - Toolbar
    @ToolbarContentBuilder
    var homeToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            topAppbarCollectionLogo
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // TODO
            } label: {
                Image(systemName: "tv.badge.wifi")
            }
        }
    }
    
    // MARK: Views
    var topAppbarCollectionLogo: some View {
        loadAsyncImage(
            imageUrl: mainLogoUrl.getImagePosterPath(),
            width: 60,
            height: 60,
            placeholderBackground: Color.clear
        )
        .opacity(viewModel.toolbarLogoOpacity)
    }
    
    func mainPosterImage(_ geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            loadAsyncImage(
                imageUrl: viewModel.mainPosterImage.getImagePosterPath(ORIGINAL_POSTER_WIDTH),
                contentMode: .fill,
                width: geometry.size.width,
                height: geometry.size.height / 1.5,
                placeholderBackground: Color.customColors.categoryCapsuleColor
            )
            .fadedScrollViewMask()
            .fadedBottomViewMask(
                startPoint: .bottom,
                endPoint: .center
            )
            .overlay {
                Color.black.opacity(viewModel.overlayOpacity)
            }
            
            Spacer()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(Color.black)
                .fadedBottomViewMask(
                    startPoint: .top,
                    endPoint: .bottom
                )
        }
    }
    
    func mainCollectionLogo(geometry: GeometryProxy) -> some View {
        loadAsyncImage(
            imageUrl: mainLogoUrl.getImagePosterPath(),
            width: .infinity,
            height: 100,
            placeholderBackground: Color.clear
        )
        .padding(.horizontal)
        .scaleEffect(viewModel.mainLogoScale)
        .opacity(viewModel.mainLogoOpacity)
        .position(x: geometry.size.width / 2, y: geometry.size.height / 2 - viewModel.logoPositionOffset)
    }
    
    func scrollableCollectionContent(geometry: GeometryProxy) -> some View {
        ObservableScrollView(contentOffset: $contentOffset) {
            VStack(alignment: .center) {
                moviesContent
            }
            .padding(.horizontal)
            .padding(.top, geometry.size.height / 1.6)
            .padding(.bottom)
        }
        .scrollIndicators(.hidden)
    }
    
    var moviesContent: some View {
        VStack {
            if !viewModel.movies.isEmpty {
                Text(collection?.name ?? "")
                    .font(.subheadline)
                    .foregroundStyle(Color.customColors.secondaryTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                LazyVGridMoviesView(
                    movies: viewModel.movies,
                    movieItemSize: CGSize(width: 110, height: 150),
                    lazyVGridColumns: 3,
                    lazyVGridSpacing: (Constants.TEN, Constants.TEN)) { movie in
                        selectedMovie = movie
                    }
                
            } else {
                ContentNotAvailableView(title: collection?.name ?? "")
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: View functions
    private func onScrollViewContentOffsetChange(value: CGFloat) {
        print("tellContentOffset: \(value)")
        withAnimation(.easeInOut) {
            viewModel.showToolbarBackground = value < Constants.MIN_SEARCH_APP_BAR_OFFSET
            viewModel.toolbarLogoOpacity = value < -Constants.TWENTY ? increaseOpacity(value, Constants.TWENTY): 0
            viewModel.mainLogoScale = value < -Constants.TWENTY ? scaleUp(value, Constants.TWENTY) : Constants.ONE
            viewModel.mainLogoOpacity = value < -Constants.TWENTY ? decreaseOpacity(value, Constants.TWENTY) : Constants.ONE
            viewModel.logoPositionOffset = value < -Constants.TEN ? -(value + Constants.ONE) * Constants.ONE : 0
            
            viewModel.overlayOpacity = value < -100 ? increaseOpacity(value, 0.1, 0.8) : 0
        }
    }
}

// MARK: Preview
#Preview {
    NavigationStack {
        SearchCollectionDetailView(
            collection: PreviewDataProvider.instance.collection,
            mainLogoUrl: "/uBz2Dj3sUFQQJrX9njI9MgEwvd8.png"
        )
    }
}
