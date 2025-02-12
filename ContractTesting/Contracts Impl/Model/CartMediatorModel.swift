//
//  CartMediatorModel.swift
//  ContractTesting
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

import CartModule
import Consumer

struct CartMediatorModel: MarketplaceCart {
    let id: String
    let store: any MarketplaceStore
    let items: [any MarketplaceCartItem]
  
    init(id: String, store: any MarketplaceStore, items: [any MarketplaceCartItem]) {
      self.id = id
      self.store = store
      self.items = items
    }
  
    init(expressCart: any ExpressCart) {
        self.id = expressCart.id
        self.store = CartStoreMediatorModel(
            id: expressCart.store.id,
            localizedName: expressCart.store.localizedName,
            minimumOrder: expressCart.store.minimumOrder,
            currency: expressCart.store.currency
        )
        self.items = expressCart.items.map { item in
          let sellingItem = CartSellingItemMediatonModel(
              id: item.sellingItem.id,
              name: item.sellingItem.name,
              price: item.sellingItem.price,
              discountedPrice: item.sellingItem.discountedPrice,
              currency: item.sellingItem.currency
          )
          return CartItemMediatorModel(
              id: item.id,
              sellingItem: sellingItem,
              quantity: item.quantity
          )
        }
    }
}
