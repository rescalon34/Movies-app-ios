//
//  Int+Extension.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import Foundation

extension Int {
    
    /// Converting runtime duration to hours and minutes. E.g. 1h 22m
    func formatRuntime() -> String? {
        let hours = self / 60
        let minutes = self % 60
        
        return "\(hours)h \(minutes)m"
    }
}
