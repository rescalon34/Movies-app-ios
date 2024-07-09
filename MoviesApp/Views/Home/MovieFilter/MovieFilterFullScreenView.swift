//
//  MovieFilterFullScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 10/6/24.
//

import SwiftUI

/// This view displays a list of all movie genres, they are passed from the previous screen to avoid making the request
/// in this screen.

/// Note:
///
/// We could have used a `closure()` to update the selected category from the inner view
/// until it reaches the parent view and then execute the desired logic.
///
/// However, to use a different approach, `@Binding` + onChange() were used to handle the same result.
/// the parent view will observe any changes from the `selectedGenres` Binding variable using the onChange(of: ) callback once it receives a different selected genre.
struct MovieFilterFullScreenView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismissView
    @State var rotationDegrees: CGFloat = Constants.FORTY_FIVE_DEGREES
    let genres: [Genre]
    @Binding var selectedGenre: Genre
    
    // MARK: - Body
    var body: some View {
        VStack {
            categoriesContent
            dismissScreenIcon
        }
        .frame(maxWidth: .infinity)
        .background(
            BackgroundBlurView()
                .ignoresSafeArea()
        )
        .onAppear {
            animateXMarkIcon(degrees: Constants.MINUS_NINETY_DEGREES)
        }
    }
    
    // MARK: - Views
    private var categoriesContent: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 40) {
                    extraScrollSpacer()
                    ForEach(genres) { genre in
                        categoryItem(genre: genre.name)
                            .onAppear {
                                scrollToSelectedCategory(proxy: proxy)
                            }
                            .onTapGesture {
                                selectedGenre = genre
                                onDismiss()
                            }
                    }
                    extraScrollSpacer()
                }
            }
        }
        .fadedScrollViewMask()
    }
    
    // MARK: View Functions
    @ViewBuilder
    private func categoryItem(genre: String) -> some View {
        let isSelectedGenre = selectedGenre.name == genre
        
        Text(genre)
            .id(genre)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(isSelectedGenre ? .headline : .subheadline)
            .fontWeight(isSelectedGenre ? .bold : .light)
    }
    
    /// This extra spacer gives a nice scrolling effect at the top and bottom
    /// of the ScrollView while scrolling categories.
    private func extraScrollSpacer() -> some View {
        Spacer().frame(height: 120)
    }
    
    private var dismissScreenIcon: some View {
        CircleIconView(iconName: "xmark")
            .onTapGesture {
                onDismiss()
            }
            .rotationEffect(.degrees(rotationDegrees))
            .padding(.vertical, 32)
    }
    
    private func onDismiss() {
        animateXMarkIcon(degrees: Constants.ZERO_DEGREES)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            dismissView()
        }
    }
    
    // MARK: Animation Functions
    private func animateXMarkIcon(degrees: CGFloat) {
        withAnimation(.easeInOut.delay(0.1)) {
            rotationDegrees = degrees
        }
    }
    
    private func scrollToSelectedCategory(proxy: ScrollViewProxy) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut) {
                proxy.scrollTo(selectedGenre.name, anchor: .center)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        MovieFilterFullScreenView(
            genres: PreviewDataProvider.instance.genres,
            selectedGenre: .constant(PreviewDataProvider.instance.genres[0])
        )
    }
}
