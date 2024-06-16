//
//  ProfileScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct ProfileScreenView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            BaseScreenView {
                VStack {
                    headerProfileContent
                    makeProfileOptions
                }
                .padding(.vertical, 24)
            }
        }
    }
    
    // MARK: - Views
    @ViewBuilder
    private var headerProfileContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(viewModel.profiles) { profile in
                    makeProfileItem(profile: profile)
                }
            }
            .padding(.horizontal, 40)
        }
        Text("Edit Profiles".uppercased())
            .padding()
            .padding(.horizontal)
            .background(Color.accentColor.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(.top, 8)
            .padding(.bottom)
            .font(.subheadline)
            .bold()
    }
    
    private func makeProfileItem(profile: Profile) -> some View {
        VStack {
            CircularGradientProfileView(
                imageUrl: profile.imageUrl,
                size: CGSize(width: 80, height: 80),
                isSelected: profile.isSelected,
                colors: profile.colors
            )
            .onTapGesture { onProfileItemClick(profile.id) }
            Text(profile.name)
                .padding(.top, 1)
                .foregroundColor(profile.isSelected ? .primary : .secondaryText)
                .bold()
        }
    }
    
    @ViewBuilder
    private var makeProfileOptions: some View {
        List {
            CustomNavigationLink(destination: Text("App Settings Screen")) {
                makeProfileOptionItem(option: "App Settings")
            }
            CustomNavigationLink(destination: Text("Account Screen")) {
                makeProfileOptionItem(option: "Account Policy")
            }
            CustomNavigationLink(destination: Text("Privacy Policy Screen")) {
                makeProfileOptionItem(option: "Privacy Policy")
            }
            CustomNavigationLink(destination: Text("Credits")) {
                makeProfileOptionItem(option: "Credits")
            }
            makeProfileOptionItem(option: "Log Out")
            
            Text("Version: \(viewModel.appVersion)")
                .font(.caption)
                .foregroundStyle(Color.customColors.secondaryTextColor)
                .listRowBackground(Color.customColors.backgroundColor)
                .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(.plain)
    }
    
    private func makeProfileOptionItem(option: String) -> some View {
        Text(option)
            .font(.callout)
            .bold()
            .listRowBackground(Color.customColors.backgroundColor)
    }
    
    // MARK: - Functions
    private func onProfileItemClick(_ profileId: Int) {
        // TODO: Handle each action depending on the selected profileId
        print("profileId: \(profileId)")
    }
}

// MARK: - Preview
#Preview {
    ProfileScreenView()
}
