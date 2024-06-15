//
//  ProfileScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct ProfileScreenView: View {
    
    var body: some View {
        BaseScreenView {
            VStack {
                headerProfileContent
                List {
                    ForEach(0..<6) { item in
                        Text("App Settings")
                            .listRowBackground(Color.customColors.backgroundColor)
                    }
                }
                .listStyle(.plain)
            }
            .padding(.vertical, 24)
        }
    }
    
    @ViewBuilder
    private var headerProfileContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(0..<2) { profile in
                    profileItemView()
                }
            }
            .padding(.horizontal, 40)
        }
        Text("Edit Profiles".uppercased())
            .padding()
            .padding(.horizontal)
            .background(Color.accentColor.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
    }
    
    private func profileItemView() -> some View {
        VStack {
            CircularGradientProfileView(
                imageUrl: PreviewDataProvider.instance.profileImage,
                size: CGSize(width: 80, height: 80),
                isSelected: true
            )
            Text("Robert")
                .padding(.top, 4)
                .foregroundColor(.primary)
                .bold()
        }
    }
}

#Preview {
    ProfileScreenView()
}
