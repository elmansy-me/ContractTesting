//
//  CartItem.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 07.02.2025.
//

struct CartItem: MarketplaceCartItem {
    let id: String
    let name: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
    let quantity: Int
  
    init(
        id: String,
        name: String,
        price: Double,
        discountedPrice: Double?,
        currency: String,
        quantity: Int
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.discountedPrice = discountedPrice
        self.currency = currency
        self.quantity = quantity
    }
}
 
// Providing initializer for internal usage.
extension CartItem {
    init(product: Product, quantity: Int) {
        self.id = product.id
        self.name = product.name
        self.price = product.price
        self.discountedPrice = product.discountedPrice
        self.currency = product.currency
        self.quantity = quantity
    }
}
