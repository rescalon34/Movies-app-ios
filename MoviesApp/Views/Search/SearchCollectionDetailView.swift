//
//  SearchCollectionDetailView.swift
//  MoviesApp
//
//  Created by rescalon on 4/7/24.
//

import SwiftUI

struct SearchCollectionDetailView: View {
    
    // MARK: - ViewModel
    @StateObject var viewModel: SearchCollectionDetailViewModel = .init()
    
    // MARK: - Properties
    let collection: Collection?
    
    // MARK: - State properties
    @State private var contentOffset: CGFloat = 0
    
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
            imageUrl: collection?.logo?.getImagePosterPath() ?? "",
            width: 60,
            height: 60
        )
        .opacity(viewModel.toolbarLogoOpacity)
    }
    
    func mainPosterImage(_ geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            loadAsyncImage(
                imageUrl: collection?.backdropPath?.getImagePosterPath(ORIGINAL_POSTER_WIDTH) ?? "",
                contentMode: .fill,
                width: geometry.size.width,
                height: geometry.size.height / 1.5,
                placeholderBackground: Color.customColors.categoryCapsuleColor
            )
            .fadedBottomViewMask(
                startPoint: .bottom,
                endPoint: .center
            )
            
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
            imageUrl: collection?.logo?.getImagePosterPath() ?? "",
            width: .infinity,
            height: 100
        )
        .scaleEffect(viewModel.mainLogoScale)
        .opacity(viewModel.mainLogoOpacity)
        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }
    
    func scrollableCollectionContent(geometry: GeometryProxy) -> some View {
        ObservableScrollView(contentOffset: $contentOffset) {
            VStack(alignment: .leading) {
                Text(collection?.name ?? "")
                    .font(.subheadline)
                    .foregroundStyle(Color.customColors.secondaryTextColor)
                    .bold()
                
                // TODO: Show proper collection list
                LazyVGridMoviesView(
                    movies: PreviewDataProvider.instance.movies,
                    movieItemSize: CGSize(width: 110, height: 150),
                    lazyVGridColumns: 3,
                    lazyVGridSpacing: (Constants.TEN, Constants.TEN)
                ) { _ in }
            }
            .padding(.horizontal)
            .padding(.top, geometry.size.height / 1.7)
        }
        .scrollIndicators(.hidden)
    }
    
    // MARK: View functions
    private func onScrollViewContentOffsetChange(value: CGFloat) {
        print("tellContentOffset: \(value)")
        withAnimation(.easeInOut) {
            viewModel.showToolbarBackground = value < Constants.MIN_SEARCH_APP_BAR_OFFSET
            viewModel.toolbarLogoOpacity = value < -Constants.TWENTY_FIVE ? increaseOpacity(value, Constants.TWENTY_FIVE): 0
            viewModel.mainLogoScale = value < -Constants.TWENTY ? scaleUp(value, Constants.TWENTY) : Constants.ONE
            viewModel.mainLogoOpacity = value < -Constants.TWENTY ? decreaseOpacity(value, Constants.TWENTY) : Constants.ONE
        }
    }
}

// MARK: Preview
#Preview {
    NavigationStack {
        SearchCollectionDetailView(
            collection: PreviewDataProvider.instance.collection
        )
    }
}
