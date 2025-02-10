//
//  CartItem.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import CartModule
import Consumer

struct CartItemMediatorModel: ExpressCartItem, MarketplaceCartItem {
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
    
    init(marketplaceItem: any MarketplaceCartItem) {
        self.id = marketplaceItem.id
        self.name = marketplaceItem.name
        self.price = marketplaceItem.price
        self.discountedPrice = marketplaceItem.discountedPrice
        self.currency = marketplaceItem.currency
        self.quantity = marketplaceItem.quantity
    }
}
