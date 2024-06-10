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
    
    /// Note:
    /// - This documentation explains the rationale behind using a click callback.
    ///
    /// We could have used a `@Binding` variable to update the selected category from the inner view
    /// until it reaches the parent view hosting the `@State` variable.
    ///
    /// However, to demonstrate a different approach, we decided to use a click callback. This way,
    /// the parent view will update the `@State` selectedCategory once it receives the `onCategoryClick` callback.
    
    /// - `@Binding var selectedCategory: String`
    let selectedCategory: String
    let onCategoryClick: (String) -> ()
    
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
                .fill(Color.customColors.categoryCapsuleColor)
        )
        .onTapGesture {
            
            // if condition for testing purposes, this sould return the right selected category.
            if selectedCategory == "Comedy" {
                onCategoryClick("Featured")
            } else {
                onCategoryClick("Comedy")
            }
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CategoryCapsuleView(
        selectedCategory: PreviewDataProvider.instance.selectedCategory,
        onCategoryClick: { _ in }
    )
    .previewLayout(.sizeThatFits)
}
