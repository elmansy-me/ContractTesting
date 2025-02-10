//
//  ConsumerCartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

public protocol MarketplaceCartItem: Identifiable, Sendable {
    var id: String { get }
    var name: String { get }
    var price: Double { get }
    var discountedPrice: Double? { get }
    var currency: String { get }
    var quantity: Int { get }
}
