//
//  Cart.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

struct Cart: MarketplaceCart {
    var id: String
    var store: any MarketplaceStore
    var items: [any MarketplaceCartItem]
}
