//
//  CustomTabItemView.swift
//  MoviesApp
//
//  Created by rescalon on 13/6/24.
//

import SwiftUI

struct CustomTabItemView: View {
    // MARK: - Properties
    let icon: AnyView
    let title: String
    let isSelected: Bool
    let tag: MainTabBarItems
    let action: () -> Void
    
    // MARK: - Boby
    var body: some View {
        
        let selectedItemColor = isSelected ? Color.customColors.accentColor : .customColors.secondaryTextColor.opacity(0.6)
        VStack {
            // Show a custom image for the profile tabBar item.
            if tag == .Profile {
                AnyView(
                    CircularGradientProfileView(
                        imageUrl: PreviewDataProvider.instance.profileImage,
                        size: CGSize(width: 40, height: 40),
                        strokeWidth: 3,
                        isSelected: isSelected,
                        colors: PreviewDataProvider.instance.profiles[0].colors // TODO: must come from the selected profile
                    )
                )
                .padding(.top, 4)
            } else {
                icon.foregroundColor(selectedItemColor)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom)
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        CustomTabItemView(
            icon: AnyView(Image(systemName: "house")),
            title: "Home",
            isSelected: true,
            tag: .Profile
        ) { }
    }
}
