//
//  MainTabView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

/*
 This view hosts all bottom tabView options.
 */
struct MainTabView: View {
    
    @State private var selectedTab : MainTabViewOptions = .Home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(MainTabViewOptions.Home)
            
            ProfileScreenView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(MainTabViewOptions.Profile)
        }
    }
}

#Preview {
    MainTabView()
}
