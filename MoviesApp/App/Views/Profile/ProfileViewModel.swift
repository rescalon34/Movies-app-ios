//
//  ProfileViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published private (set) var profiles: [Profile] = []
    @Published private (set) var appVersion = "1.0.0"
    
    init() {
        getProfileData()
        appendAddProfileOption()
    }
    
    // TODO: load this data from real source of truth
    private func getProfileData() {
        self.profiles = PreviewDataProvider.instance.profiles
    }
    
    private func appendAddProfileOption() {
        self.profiles.append(
            .init(
                id: 0,
                name: "Add Profile",
                imageUrl: "",
                isSelected: false,
                colors: nil
            )
        )
    }
}
