//
//  ContentOffsetKey.swift
//  MoviesApp
//
//  Created by rescalon on 9/6/24.
//

import Foundation
import SwiftUI

/// A custom preference key used to track and accumulate the content offset in a scroll view.
///
/// This preference key is used to communicate the position of views within a scroll view to the parent view.
/// It tracks the vertical offset of the content and allows the parent view to respond to changes in the scroll position
struct ContentOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
