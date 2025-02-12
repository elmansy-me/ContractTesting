//
//  ExpressCartViewModel.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

@MainActor
final class ExpressCartViewModel: ObservableObject {
    private var cartModel: ExpressCartModel?
    
    @Published var totalPrice: Double = 0
    
    init() {}
  
    func openCart() async {
        // TODO: Open the Cart popup.
    }
  
    func loadCart(forStore store: any ExpressCartStore) -> ExpressCartModel {
        let cartModel = ExpressCartModel(id: "FD863335-74B2-4CB5-B9C8-92568C2C7D50", store: store, items: [])
        self.cartModel = cartModel
        return cartModel
    }
  
    func addItem(_ item: any ExpressSellingItem, quantity: Int) throws -> ExpressCartModel {
        guard var cartModel else {
            throw NSError()
        }
        
        let itemPrice = item.discountedPrice ?? item.price
        totalPrice += itemPrice * Double(quantity)
      
        let cartItem = ExpressCartItemModel(id: "7EA4511D-F487-4624-8E96-DE1149764724", sellingItem: item, quantity: quantity)
        cartModel.items.append(cartItem)
        self.cartModel = cartModel
        return cartModel
    }
    
    func updateItem(_ item: any ExpressSellingItem, newQuantity: Int) throws -> ExpressCartModel {
        guard
            var cartModel,
            let itemIndex = cartModel.items.firstIndex(where: { $0.id == item.id })
        else {
            throw NSError()
        }
        
        let oldItem = cartModel.items[itemIndex]
        let oldItemPrice = oldItem.sellingItem.discountedPrice ?? oldItem.sellingItem.price
        let oldTotalPrice = oldItemPrice * Double(oldItem.quantity)
        let itemPrice = item.discountedPrice ?? item.price
        totalPrice += itemPrice * Double(newQuantity) - oldTotalPrice
      
        let cartItem = ExpressCartItemModel(id: "7EA4511D-F487-4624-8E96-DE1149764724", sellingItem: item, quantity: newQuantity)
        cartModel.items[itemIndex] = cartItem
        self.cartModel = cartModel
        return cartModel
    }
  
    func removeItem(_ item: any ExpressSellingItem) throws -> ExpressCartModel {
        guard
            var cartModel,
            let itemIndex = cartModel.items.firstIndex(where: { $0.sellingItem.id == item.id })
        else {
            throw NSError()
        }
      
        let oldItem = cartModel.items[itemIndex]
        let oldItemPrice = oldItem.sellingItem.discountedPrice ?? oldItem.sellingItem.price
        let oldTotalPrice = oldItemPrice * Double(oldItem.quantity)
        totalPrice -= oldTotalPrice
      
        cartModel.items.remove(at: itemIndex)
        self.cartModel = cartModel
        return cartModel
    }
  
    func clearCart() {
        cartModel = nil
    }
}
