//
//  CartItem.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import CartModule
import Consumer

struct CartItemMediatorModel: MarketplaceCartItem {
    let id: String
    let sellingItem: any MarketplaceSellingItem
    let quantity: Int
  
    init(id: String, sellingItem: ExpressSellingItem, quantity: Int) {
        self.id = id
        self.sellingItem = CartSellingItemMediatonModel(
            id: sellingItem.id,
            localizedName: sellingItem.localizedName,
            price: sellingItem.price,
            discountedPrice: sellingItem.discountedPrice,
            currency: sellingItem.currency,
            maxQuantity: sellingItem.maxQuantity,
            imageURL: sellingItem.imageURL
        )
        self.quantity = quantity
    }
}
