//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

public protocol MarketplaceCartActionsHandler: Sendable {
    func setConfigurations(_ configurations: [MarketplaceCartConfiguration]) async
  
    func cart(forStoreID storeID: String) async throws -> any MarketplaceCart
  
    func addItem(
      _ item: any MarketplaceCartItem,
      toCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart
  
    func updateItem(
      _ item: any MarketplaceCartItem,
      inCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart
  
    func removeItem(
      _ item: any MarketplaceCartItem,
      fromCart cart: any MarketplaceCart
    ) async throws -> any MarketplaceCart

    func clearCart() async throws
}
