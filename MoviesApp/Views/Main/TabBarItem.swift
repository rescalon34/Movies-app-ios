//
//  TabBarItem.swift
//  MoviesApp
//
//  Created by rescalon on 13/6/24.
//
import SwiftUI

/// This struct represents each TabBarItem content, as any of them can receive any view to display.
struct TabBarItem {
    var title: String = ""
    let icon: AnyView
    let tag: MainTabBarItems
}
