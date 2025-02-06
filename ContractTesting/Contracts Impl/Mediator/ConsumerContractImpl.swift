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
    
    var cartBadgeView: () -> any View {
        cartProvider.cartBadgeView
    }
  
    func setConfigurations(_ configurations: [MarketplaceCartConfiguration]) async {
        cartProvider.configure(
            recommendedItemsDisplayed: configurations.contains(.recommendedItemsVisible),
            addressChangeAllowed: configurations.contains(.addressChanging)
        )
    }
    
    func cart(forStoreID storeID: String) async throws -> any MarketplaceCart {
        let cart = try await cartProvider.cart(forStoreID: storeID)
        return CartMediatorModel(id: cart.id, store: cart.store, items: cart.items).marketplaceCart
    }
    
    func addItem(
        _ item: any MarketplaceCartItem,
        toCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart {
        let cart = CartMediatorModel(marketplaceCart: cart)
        let item = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's AddItem request to CartModule")
      
        let updatedCart = try await cartProvider.addItem(item, toCart: cart)
        return CartMediatorModel(id: updatedCart.id, store: updatedCart.store, items: updatedCart.items).marketplaceCart
    }
    
    func updateItem(
        _ item: any MarketplaceCartItem,
        inCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart {
        let cart = CartMediatorModel(marketplaceCart: cart)
        let item = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's UpdateItem request to CartModule")
      
        let updatedCart = try await cartProvider.updateItem(item, inCart: cart)
        return CartMediatorModel(id: updatedCart.id, store: updatedCart.store, items: updatedCart.items).marketplaceCart
    }
    
    func removeItem(
        _ item: any MarketplaceCartItem,
        fromCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart {
        let cart = CartMediatorModel(marketplaceCart: cart)
        let item = CartItemMediatorModel(marketplaceItem: item)

        print("🔥 ParentApp: Passing consumer's RemoveItem request to CartModule")
      
        let updatedCart = try await cartProvider.removeItem(item, fromCart: cart)
        return CartMediatorModel(id: updatedCart.id, store: updatedCart.store, items: updatedCart.items).marketplaceCart
    }
    
    func clearCart() async throws {
        try await cartProvider.clearCart()
    }
    
    func openCart() async {
        await cartProvider.openCart()
    }
}
