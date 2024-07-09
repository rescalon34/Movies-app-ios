//
//  BaseScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

/// This screen is intended to contain reusable content like the
/// background color for all screens.
struct BaseScreenView<Content: View>: View {
    
    var isLoading: Bool = false
    let content: () -> Content
    
    var body: some View {
        ZStack {
            Color.customColors.backgroundColor
                .ignoresSafeArea()
            content()
            if isLoading { ProgressView() }
        }
    }
}

#Preview {
    BaseScreenView(isLoading: true) {
        Text("Base screen")
    }
}
