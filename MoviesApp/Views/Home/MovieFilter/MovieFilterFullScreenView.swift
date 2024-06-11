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
            xMarkCircularView
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
        ScrollView {
            VStack(spacing: 32) {
                addEmptySpacer(heigth: 100)
                ForEach(viewModel.movieFilters, id: \.self) { category in
                    categoryItem(category: category)
                }
                addEmptySpacer(heigth: 200)
            }
        }
    }
    
    // MARK: Functions
    private func categoryItem(category: String) -> some View {
        Text(category)
            .frame(maxWidth: .infinity)
            .font(.subheadline)
            .onTapGesture {
                selectedCategory = category
                onDismiss()
            }
    }
    
    private var xMarkCircularView: some View {
        CircleIconView(iconName: "xmark")
            .onTapGesture {
                onDismiss()
            }
            .rotationEffect(.degrees(rotationDegrees))
            .padding(.vertical, 32)
    }
    
    private func animateXMarkIcon(degrees: CGFloat) {
        withAnimation(.easeInOut.delay(0.2)) {
            rotationDegrees = degrees
        }
    }
    
    private func addEmptySpacer(heigth: CGFloat) -> some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: heigth)
    }
    
    private func onDismiss() {
        animateXMarkIcon(degrees: Constants.ZERO_DEGREES)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            presentationMode.wrappedValue.dismiss()
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
