//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var selectedCategory: String = "Comedy"
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            VStack {
                homeToolbar
                Spacer()
                Text("Home Screen")
                    .foregroundColor(.customColors.accentColor)
                Spacer()
            }
            
        }
    }
    
    // MARK: - Views
    var homeToolbar : some View {
        CategoryToolbarView(
            toolbarTitle: "Movies",
            selectedCategory: selectedCategory,
            onCategoryClick: { category in
                print("clicked category: \(category)")
                selectedCategory = category
            }
        )
        .toolbar {
            ToolbarItem {
                Button {
                    // TODO
                } label: {
                    Image(systemName: "tv.badge.wifi")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreenView(selectedCategory: PreviewDataProvider.instance.selectedCategory)
    }
}
