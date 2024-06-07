//
//  HomeToolbarView.swift
//  MoviesApp
//
//  Created by rescalon on 6/6/24.
//

import SwiftUI

/*
 Reusable Toolbar with Category Capsule view.
 
 This view displays a toolbar with a title and a category capsule.
 It uses a closure to handle tap gestures on the category capsule,
 allowing the parent view to respond to category selection changes.
 */
struct CategoryToolbarView: View {
    
    // MARK: - Properties
    let toolbarTitle : String
    let selectedCategory: String
    let onCategoryClick: (String) -> ()
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(toolbarTitle)
                .font(.title)
                .bold()
                .lineLimit(1)
            Spacer()
            CategoryCapsuleView(
                selectedCategory: selectedCategory,
                onCategoryClick: onCategoryClick
            )
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.customColors.backgroundColor)
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CategoryToolbarView(
        toolbarTitle: "Movies",
        selectedCategory: "Comedies"
    ) { _ in }
}
