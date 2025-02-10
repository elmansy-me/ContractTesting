//
//  Store.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

struct Store: MarketplaceStore {
    let id: String
    let localizedName: String
    let minimumOrder: Double
    let currency: String
}
