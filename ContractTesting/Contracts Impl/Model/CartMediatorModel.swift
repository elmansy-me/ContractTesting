//
//  CartMediatorModel.swift
//  ContractTesting
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

import CartModule
import Consumer

struct CartMediatorModel: ExpressCart {
    let id: String
    let store: any ExpressCartStore
    var items: [any ExpressCartItem]
  
    init(id: String, store: any ExpressCartStore, items: [any ExpressCartItem]) {
      self.id = id
      self.store = store
      self.items = items
    }
  
    init(marketplaceCart: any MarketplaceCart) {
        self.id = marketplaceCart.id
        self.store = CartStoreMediatorModel(marketplaceStore: marketplaceCart.store)
        self.items = marketplaceCart.items.map(CartItemMediatorModel.init)
    }
}

// Backward model mapping

extension CartMediatorModel {
    private struct CartConsumerModel: MarketplaceCart {
        var id: String
        var store: any MarketplaceStore
        var items: [any MarketplaceCartItem]
    }
  
    var marketplaceCart: any MarketplaceCart {
        let store = CartStoreMediatorModel(id: store.id, localizedName: store.localizedName)
        let items = items.map { item in
            CartItemMediatorModel(
                id: item.id,
                name: item.name,
                price: item.price,
                currency: item.currency,
                quantity: item.quantity
            ).marketplaceCartItem
        }
        return CartConsumerModel(id: id, store: store.marketplaceStore, items: items)
    }
}
