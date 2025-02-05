//
//  CartItem.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import CartModule
import Consumer

struct CartItemModel: CartItem {
    
    let id: String
    let price: Double
    var count: Int
    
    init(id: String, price: Double, count: Int) {
        self.id = id
        self.price = price
        self.count = count
    }
    
    init(item: any MarketplaceCartItem) {
        self.id = item.id
        self.price = item.price
        self.count = item.count
    }
}
