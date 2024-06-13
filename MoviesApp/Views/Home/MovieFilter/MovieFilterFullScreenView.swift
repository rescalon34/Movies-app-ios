//
//  MovieFilterFullScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 10/6/24.
//

import SwiftUI

struct MovieFilterFullScreenView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: MovieFilterViewModel = MovieFilterViewModel()
    @State var rotationDegrees: CGFloat = Constants.FORTY_FIVE_DEGREES
    @Binding var selectedCategory: String
    
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
                    ForEach(viewModel.movieFilters, id: \.self) { category in
                        categoryItem(category: category)
                            .onAppear {
                                scrollToSelectedCategory(proxy: proxy)
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
    private func categoryItem(category: String) -> some View {
        let isSelectedCategory = selectedCategory == category
        
        Text(category)
            .id(category)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(isSelectedCategory ? .headline : .subheadline)
            .fontWeight(isSelectedCategory ? .bold : .light)
            .onTapGesture {
                selectedCategory = category
                onDismiss()
            }
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
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    // MARK: Animation Functions
    private func animateXMarkIcon(degrees: CGFloat) {
        withAnimation(.easeInOut.delay(0.1)) {
            rotationDegrees = degrees
        }
    }
    
    private func scrollToSelectedCategory(proxy: ScrollViewProxy) {
        withAnimation(.easeInOut) {
            proxy.scrollTo(selectedCategory, anchor: .center)
        }
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        MovieFilterFullScreenView(
            selectedCategory: .constant("Comedy")
        )
    }
}
