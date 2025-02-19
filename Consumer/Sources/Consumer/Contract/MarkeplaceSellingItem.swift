//
//  MarkeplaceSellingItem.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 10.02.2025.
//

public protocol MarketplaceSellingItem: Identifiable, Sendable {
    var id: String { get } // It's a legacy Product ID.
    var localizedName: String { get }
    var price: Double { get }
    var discountedPrice: Double? { get }
    var currency: String { get }
    var maxQuantity: Int { get }
    var imageURL: String { get }
}
