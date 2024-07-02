//
//  CategoryCapsuleView.swift
//  MoviesApp
//
//  Created by rescalon on 6/6/24.
//

import SwiftUI

/// Reusable Category Capsule View.
///
/// This view displays a category label inside a capsule-shaped background
/// with a chevron icon to indicate a dropdown or selection.
/// It uses a closure to handle tap gestures, allowing the parent view
/// to respond to category selection changes.
struct CategoryCapsuleView: View {
    
    // MARK: - Properties
    
    /// - Parameters:
    ///   - selectedCategory: A read-only string passed from the parent with the selected Category from the movie filters screen.
    ///   - onCategoryClick: Closure triggered after tapping on the genre item, so the parent view can execute the desired logic.
    let selectedCategory: String
    let onCategoryClick: () -> ()
    
    // MARK: - Body
    var body: some View {
        HStack {
            Group {
                Text(selectedCategory)
                Image(systemName: "chevron.down")
            }
            .font(.subheadline)
            .foregroundColor(.primary)
        }
        .lineLimit(1)
        .foregroundColor(.white)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Color.customColors.categoryCapsuleLigthColor)
        )
        .onTapGesture {
            onCategoryClick()
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CategoryCapsuleView(
        selectedCategory: PreviewDataProvider.instance.selectedCategory,
        onCategoryClick: { }
    )
    .previewLayout(.sizeThatFits)
}
