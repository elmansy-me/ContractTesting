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
  
    func cartBadgeView(forStore store: any ExpressCartStore) -> ExpressCartInteractor.BadgeViewWrapper {
        {
            ExpressCartView(viewModel: self.cartViewModel)
        }
    }

    func openCart() async {
        await cartViewModel.openCart()
    }
  
    func cart(forStore store: any ExpressCartStore) async throws -> any ExpressCart {
        await cartViewModel.loadCart(forStoreID: store.id)
    }
  
    func configure(recommendedItemsDisplayed: Bool, addressChangeAllowed: Bool) {
        // TODO: Add implementation
    }
  
    func addItem(_ item: any ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart {
        try await self.cartViewModel.addItem(item)
    }
    
    func updateItem(_ item: any ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart {
        try await cartViewModel.updateItem(item)
    }
    
    func removeItem(_ item: any ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart {
        try await cartViewModel.removeItem(item)
    }
  
    func clearCart() async throws {
        Task.detached {
            await self.cartViewModel.clearCart()
        }
    }
}
