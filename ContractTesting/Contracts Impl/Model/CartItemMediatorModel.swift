//
//  CartItem.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import CartModule
import Consumer

struct CartItemMediatorModel: ExpressCartItem {
    let id: String
    let name: String
    let price: Double
    let currency: String
    var quantity: Int
  
    init(id: String, name: String, price: Double, currency: String, quantity: Int) {
      self.id = id
      self.name = name
      self.price = price
      self.currency = currency
      self.quantity = quantity
    }
    
    init(marketplaceItem: any MarketplaceCartItem) {
        self.id = marketplaceItem.id
        self.name = marketplaceItem.name
        self.price = marketplaceItem.price
        self.currency = marketplaceItem.currency
        self.quantity = marketplaceItem.quantity
    }
}

// Backward model mapping

extension CartItemMediatorModel {
    private struct ConsumerCartItem: MarketplaceCartItem {
        let id: String
        let name: String
        let price: Double
        let currency: String
        var quantity: Int
    }
  
    var marketplaceCartItem: any MarketplaceCartItem {
        ConsumerCartItem(id: id, name: name, price: price, currency: currency, quantity: quantity)
    }
}
