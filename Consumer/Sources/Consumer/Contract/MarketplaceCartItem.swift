//
//  ConsumerCartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

public protocol MarketplaceCartItem: Identifiable, Sendable {
    var id: String { get } // It's a cart item ID, not the Product ID.
    var sellingItem: any MarketplaceSellingItem { get }
    var quantity: Int { get }
}
