//
//  AccountStatusResponse.swift
//  MoviesApp
//
//  Created by rescalon on 1/7/24.
//

import Foundation

struct AccountStatusResponse: Codable {
    let id: Int
    let favorite: Bool
    let watchlist: Bool
}

extension AccountStatusResponse {
    func toDomain() -> AccountStatus {
        return AccountStatus(
            id: self.id,
            favorite: self.favorite,
            watchlist: self.watchlist
        )
    }
}
