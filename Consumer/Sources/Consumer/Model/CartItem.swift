//
//  CartItem.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 07.02.2025.
//

struct CartItem: MarketplaceCartItem {
    let id: String
    let sellingItem: any MarketplaceSellingItem
    let quantity: Int
  
    init(id: String, sellingItem: any MarketplaceSellingItem, quantity: Int) {
        self.id = id
        self.sellingItem = sellingItem
        self.quantity = quantity
    }
}
