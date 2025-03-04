//
//  MarketplaceCartActionsHandler.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

public protocol MarketplaceCartActionsHandler: Sendable {
    func setConfigurations(_ configurations: [MarketplaceCartConfiguration]) async
  
    /// Other error types: succsess of failure as a result (current).
    func cart(forStore store: any MarketplaceStore) async throws -> any MarketplaceCart
  
    typealias CartUpdatesHandler = @Sendable (any MarketplaceCart) async -> Void
  
    // Not sure, if it needs to also return the initial Cart state or not (requesting separately).
    func subscribeToCartUpdates(forStore store: any MarketplaceStore, handler: @escaping CartUpdatesHandler) async
    
      /// This action is expected to be used only for adding Product to the Cart for the first time.
    func addItem(
      _ item: any MarketplaceSellingItem,
      quantity: Int,
      forStore store: any MarketplaceStore
    ) async throws

    /// This action is expected to be used only for changing the quantity of the Product, which is already in the Cart.
    /// Usage the item model with `quantity = 0` is forbidden, as there's a separate `removeItem(_:fromStore)` method for this.
    func updateItem(
      _ item: any MarketplaceSellingItem,
      newQuantity: Int,
      forStore store: any MarketplaceStore
    ) async throws

    /// This action is used to be used only for removing the Product from the Card, expecing it's already added there.
    func removeItem(
      _ item: any MarketplaceSellingItem,
      forStore store: any MarketplaceStore
    ) async throws

    // Edge case: won't be called if the app is terminated and the cart is cached (returned to Marketplace).
    // Should we clear it for consistency? Or should we not clear the cart when closing the stores for consistency?
    func clearCart() async throws
}
