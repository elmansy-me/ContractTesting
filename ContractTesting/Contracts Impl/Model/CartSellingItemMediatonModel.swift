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
    let localizedName: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
    let maxQuantity: Int
    let imageURL: String
  
    init(
        id: String,
        localizedName: String,
        price: Double,
        discountedPrice: Double?,
        currency: String,
        maxQuantity: Int,
        imageURL: String
    ) {
        self.id = id
        self.localizedName = localizedName
        self.price = price
        self.discountedPrice = discountedPrice
        self.currency = currency
        self.maxQuantity = maxQuantity
        self.imageURL = imageURL
    }
    
    init(marketplaceItem: any MarketplaceSellingItem) {
        self.id = marketplaceItem.id
        self.localizedName = marketplaceItem.localizedName
        self.price = marketplaceItem.price
        self.discountedPrice = marketplaceItem.discountedPrice
        self.currency = marketplaceItem.currency
        self.maxQuantity = marketplaceItem.maxQuantity
        self.imageURL = marketplaceItem.imageURL
    }
}
