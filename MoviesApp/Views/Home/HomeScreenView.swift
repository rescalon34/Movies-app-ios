//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        ZStack {
            Color.customColors.backgroundColor
                .ignoresSafeArea()
            Text("Home Screen")
                .foregroundColor(.customColors.accentColor)
        }
    }
}

#Preview {
    HomeScreenView()
}
