//
//  ConsumerContractImpl.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Consumer
import CartModule
import SwiftUI

final class CartMediatorImpl: MediatorInteractor {
    let cartProvider: any ExpressCartInteractor
    
    init(cartProvider: ExpressCartInteractor) {
        self.cartProvider = cartProvider
    }
    
    func cartBadgeView(forStore store: any MarketplaceStore) -> MarketplaceCartRepresenting.BadgeViewWrapper {
        let mappedStore = CartStoreMediatorModel(marketplaceStore: store)
        return cartProvider.cartBadgeView(forStore: mappedStore)
    }
  
    func openCart() async {
        await cartProvider.openCart()
    }
  
    func setConfigurations(_ configurations: [MarketplaceCartConfiguration]) async {
        cartProvider.configure(
            recommendedItemsDisplayed: configurations.contains(.recommendedItemsVisible),
            addressChangeAllowed: configurations.contains(.addressChanging)
        )
    }
    
    func cart(forStore store: any MarketplaceStore) async throws -> any MarketplaceCart {
        let mappedStore = CartStoreMediatorModel(marketplaceStore: store)
        let cart = try await cartProvider.cart(forStore: mappedStore)
        return CartMediatorModel(expressCart: cart)
    }
    
    func addItem(
        _ item: any MarketplaceCartItem,
        fromStore store: any MarketplaceStore
    ) async throws -> any MarketplaceCart {
        let mappedStore = CartStoreMediatorModel(marketplaceStore: store)
        let mappedItem = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's AddItem request to CartModule")
      
        let cart = try await cartProvider.addItem(mappedItem, fromStore: mappedStore)
        return CartMediatorModel(expressCart: cart)
    }
    
    func updateItem(
        _ item: any MarketplaceCartItem,
        fromStore store: any MarketplaceStore
    ) async throws -> any MarketplaceCart {
        let mappedStore = CartStoreMediatorModel(marketplaceStore: store)
        let mappedItem = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's UpdateItem request to CartModule")
      
        let cart = try await cartProvider.updateItem(mappedItem, fromStore: mappedStore)
        return CartMediatorModel(expressCart: cart)
    }
    
    func removeItem(
        _ item: any MarketplaceCartItem,
        fromStore store: any MarketplaceStore
    ) async throws -> any MarketplaceCart {
        let mappedStore = CartStoreMediatorModel(marketplaceStore: store)
        let mappedItem = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's RemoveItem request to CartModule")
      
        let cart = try await cartProvider.removeItem(mappedItem, fromStore: mappedStore)
        return CartMediatorModel(expressCart: cart)
    }
    
    func clearCart() async throws {
        try await cartProvider.clearCart()
    }
}
