//
//  GenericScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 8/7/24.
//

import SwiftUI

struct FeatureComingSoonScreenView: View {
    
    var body: some View {
        BaseScreenView {
            VStack {
                ContentNotAvailableView(
                    title: "Coming Soon",
                    description: "This feature is currently being developed. Check back soon!"
                )
            }
        }
    }
}

#Preview {
    FeatureComingSoonScreenView()
}
