//
//  MarketplaceCart.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

public protocol MarketplaceCart: Identifiable, Sendable {
    var id: String { get }
    var store: any MarketplaceStore { get }
    var items: [any MarketplaceCartItem] { get }
}
