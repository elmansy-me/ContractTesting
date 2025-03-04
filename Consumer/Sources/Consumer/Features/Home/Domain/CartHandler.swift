//
//  CartHandler.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

actor CartHandler {
    nonisolated private let cartAdapter: MarketplaceCartRepresenting
    private let store: Store
    private var cartState: (any MarketplaceCart)?
    
    init(store: Store, cartAdapter: MarketplaceCartRepresenting) {
        self.store = store
        self.cartAdapter = cartAdapter
      
        Task.detached {
            await self.loadCart()
            await self.subscribeToCartUpdates()
        }
    }
  
    private func loadCart() async {
        if let newCartState = try? await cartAdapter.cart(forStore: self.store) {
            await self.updateCartState(with: newCartState)
        }
    }
  
    private func subscribeToCartUpdates() async {
        await cartAdapter.subscribeToCartUpdates(forStore: store) { updatedCart in
            await self.updateCartState(with: updatedCart)
        }
    }

    private func updateCartState(with cart: any MarketplaceCart) async {
        self.cartState = cart
    }
  
    // MarketplaceCartProvider

    @MainActor
    var cartBadgeView: () -> any View {
        cartAdapter.cartBadgeView(forStore: store)
    }

    func openCart() async {
        await cartAdapter.openCart()
    }

    // MarketplaceCartActionsHandler

    var cart: any MarketplaceCart {
        get async throws {
            do {
                return try await cartAdapter.cart(forStore: store)
            }
        }
    }

    func addToCart(_ item: any MarketplaceSellingItem, quantity: Int) async {
        if await isItemAddedToCart(item) {
            try? await cartAdapter.updateItem(item, newQuantity: quantity, forStore: store)
        } else {
            try? await cartAdapter.addItem(item, quantity: quantity, forStore: store)
        }
    }
  
    func removeFromCart(_ item: any MarketplaceSellingItem) async {
        guard await isItemAddedToCart(item) else {
            return
        }
        
        try? await cartAdapter.removeItem(item, forStore: store)
    }

    func clearCart() async throws {
        try await cartAdapter.clearCart()
    }
  
    // Private
  
    private func isItemAddedToCart(_ item: any MarketplaceSellingItem) async -> Bool {
        guard let cartState = cartState else {
            return false
        }
        return cartState.items.contains(where: { $0.sellingItem.id == item.id })
    }
}
