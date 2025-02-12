//
//  CartSellingItemMediatonModel.swift
//  ContractTesting
//
//  Created by Pavlo Bilohaienko on 10.02.2025.
//

import CartModule
import Consumer

struct CartSellingItemMediatonModel: ExpressSellingItem, MarketplaceSellingItem {
    let id: String
    let name: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
  
    init(
        id: String,
        name: String,
        price: Double,
        discountedPrice: Double?,
        currency: String
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.discountedPrice = discountedPrice
        self.currency = currency
    }
    
    init(marketplaceItem: any MarketplaceSellingItem) {
        self.id = marketplaceItem.id
        self.name = marketplaceItem.name
        self.price = marketplaceItem.price
        self.discountedPrice = marketplaceItem.discountedPrice
        self.currency = marketplaceItem.currency
    }
}
