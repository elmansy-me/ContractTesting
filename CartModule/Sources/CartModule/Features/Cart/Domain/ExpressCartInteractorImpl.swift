//
//  ExpressCartInteractorImpl.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

final class ExpressCartInteractorImpl: ExpressCartInteractor {
    private let cartViewModel: ExpressCartViewModel
  
    init(viewModel: ExpressCartViewModel) {
        cartViewModel = viewModel
    }
  
    public var cartBadgeView: () -> any View {
        {
            ExpressCartView(viewModel: self.cartViewModel)
        }
    }
  
    public func openCart() async {
//        cartViewModel.openCart()
    }
  
    public func cart(forStoreID storeID: String) async throws -> any ExpressCart {
        await cartViewModel.loadCart(forStoreID: storeID)
    }
  
    public func configure(recommendedItemsDisplayed: Bool, addressChangeAllowed: Bool) {
        // TODO: Add implementation
    }
  
    public func clearCart() async throws {
        Task.detached {
            await self.cartViewModel.clearCart()
        }
    }
  
    public func addItem(_ item: any ExpressCartItem, toCart cart: any ExpressCart) async throws -> any ExpressCart {
        var updatedCart = try await self.cartViewModel.addItemPrice(item.price)
        updatedCart.items.append(item)
        return updatedCart
    }
  
    public func updateItem(_ item: any ExpressCartItem, inCart cart: any ExpressCart) async throws -> any ExpressCart {
        return try await cartViewModel.updateItemPrice(item.price)
    }
    
    public func removeItem(_ item: any ExpressCartItem, fromCart cart: any ExpressCart) async throws -> any ExpressCart {
        return try await cartViewModel.substractItemPrice(item.price)
    }
   
//    public func addItem(_ item: any ExpressCartItem, to cart: any ExpressCart) {
//        items.append(item)
//      
//        print("🔥 CartModule: CartItem has been added successfully.")
//        _ = cartViewModel.addItemPrice(item.price)
//    }
//    
//    public func removeItem(_ item: any ExpressExpressCartItem) {
//        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
//      
//        if items[index].count == 1 {
//          items.remove(at: index)
//        } else {
//          items[index].count -= 1
//        }
//      
//        print("🔥 CartModule: CartItem has been removed successfully.")
//        _ = cartViewModel.substractItemPrice(items.last!.price)
//    }
}
