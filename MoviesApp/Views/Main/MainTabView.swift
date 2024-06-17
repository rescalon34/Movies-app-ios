//
//  MainTabView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

/// This view hosts all bottom TabBar options.
struct MainTabView: View {
    
    // MARK: - Properties
    @State private var selectedTab : MainTabBarItems = .Home
    
    // MARK: - TabBarItems
    private var tabItems: [TabBarItem] = []
    
    init() {
        setupTabBarItems()
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            selectedScreenContent
        }
        .overlay { customTabBarContent }
    }
    
    // MARK: - Views
    @ViewBuilder
    private var selectedScreenContent: some View {
        switch selectedTab {
        case .Home:
            HomeScreenView()
        case .Search:
            SearchScreenView(screenTitle: "Search Screen")
        case .Watchlist:
            SearchScreenView(screenTitle: "Watchlist Screen")
        case .Downloads:
            SearchScreenView(screenTitle: "Downloads Screen")
        case .Profile:
            ProfileScreenView()
        }
    }
    
    private var customTabBarContent: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                ForEach(tabItems, id: \.tag) { tabItem in
                    Spacer()
                    CustomTabItemView(
                        icon: tabItem.icon,
                        title: tabItem.title,
                        isSelected: selectedTab == tabItem.tag,
                        tag: tabItem.tag,
                        action: {
                            selectedTab = tabItem.tag
                        }
                    )
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background(BackgroundBlurView())
        }
        .ignoresSafeArea(edges: .all)
    }
    // MARK: - Functions
    private mutating func setupTabBarItems() {
        self.tabItems = [
            TabBarItem(icon: AnyView(getTabBarIconImage(systemName: "house.fill")), tag: .Home),
            TabBarItem(icon: AnyView(getTabBarIconImage(systemName: "magnifyingglass")), tag: .Search),
            TabBarItem(icon: AnyView(getTabBarIconImage(systemName: "plus.circle")), tag: .Watchlist),
            TabBarItem(icon: AnyView(getTabBarIconImage(systemName: "arrow.down.to.line.compact")), tag: .Downloads),
            TabBarItem(
                icon: AnyView(
                    CircularGradientProfileView(
                        imageUrl: PreviewDataProvider.instance.profileImage,
                        size: CGSize(width: 40, height: 40),
                        isSelected: selectedTab == .Profile,
                        colors: PreviewDataProvider.instance.profiles[0].colors // TODO: must come from the selected profile.
                    )
                ),
                tag: .Profile
            )
        ]
    }
    
    @ViewBuilder
    private func getTabBarIconImage(systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
    }
}

// MARK: - Preview
#Preview {
    MainTabView()
}
