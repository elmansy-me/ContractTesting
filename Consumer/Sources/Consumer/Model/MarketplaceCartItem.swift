//
//  ConsumerCartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

public protocol MarketplaceCartItem: Identifiable {
    var id: String { get }
    var price: Double { get }
    var count: Int { get }
}
