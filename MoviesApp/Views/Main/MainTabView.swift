//
//  MainTabView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

/// This view hosts all bottom tabView options.
struct MainTabView: View {
    
    // MARK: - Properties
    @State private var selectedTab : MainTabViewOptions = .Home
    
    init() {
        setTabBarBlurEffect()
    }
    
    // MARK: - Body
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
    
    // MARK: - Functions
    private func setTabBarBlurEffect() {
        // set a clear blur effect on the TabView.
        let standardAppearance = UITabBarAppearance()
        standardAppearance.configureWithTransparentBackground()
        standardAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UITabBar.appearance().standardAppearance = standardAppearance
    }
}

#Preview {
    MainTabView()
}
