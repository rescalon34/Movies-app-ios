//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        BaseScreenView {
            VStack {
                Text("Home Screen")
                    .foregroundColor(.customColors.accentColor)
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
