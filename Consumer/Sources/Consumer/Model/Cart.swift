//
//  Cart.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

struct Cart: MarketplaceCart {
    let id: String
    let store: any MarketplaceStore
    let items: [any MarketplaceCartItem]
}
