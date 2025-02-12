//
//  ExpressSellingItem.swift
//  CartModule
//
//  Created by Pavlo Bilohaienko on 10.02.2025.
//

public protocol ExpressSellingItem: Sendable {
    var id: String { get }
    var name: String { get }
    var price: Double { get }
    var discountedPrice: Double? { get }
    var currency: String { get }
}
