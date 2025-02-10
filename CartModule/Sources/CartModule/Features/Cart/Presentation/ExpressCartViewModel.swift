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
  
    func loadCart(forStoreID storeID: String) -> ExpressCartModel {
        let store = ExpressCartStoreModel(id: storeID, localizedName: "Store \(storeID)")
        let cartModel = ExpressCartModel(id: "FD863335-74B2-4CB5-B9C8-92568C2C7D50", store: store, items: [])
        self.cartModel = cartModel
        return cartModel
    }
  
    func addItem(_ item: ExpressCartItem) throws -> ExpressCartModel {
        guard var cartModel else {
            throw NSError()
        }
        
        let itemPrice = item.discountedPrice ?? item.price
        totalPrice += itemPrice * Double(item.quantity)
      
        cartModel.items.append(item)
        self.cartModel = cartModel
        return cartModel
    }
    
    func updateItem(_ item: ExpressCartItem) throws -> ExpressCartModel {
        guard
            var cartModel,
            let itemIndex = cartModel.items.firstIndex(where: { $0.id == item.id })
        else {
            throw NSError()
        }
        
        let oldItem = cartModel.items[itemIndex]
        let oldItemPrice = oldItem.discountedPrice ?? oldItem.price
        let oldTotalPrice = oldItemPrice * Double(oldItem.quantity)
        let itemPrice = item.discountedPrice ?? item.price
        totalPrice += itemPrice * Double(item.quantity) - oldTotalPrice
      
        cartModel.items[itemIndex] = item
        self.cartModel = cartModel
        return cartModel
    }
  
    func removeItem(_ item: ExpressCartItem) throws -> ExpressCartModel {
        guard
            var cartModel,
            let itemIndex = cartModel.items.firstIndex(where: { $0.id == item.id })
        else {
            throw NSError()
        }
      
        let oldItem = cartModel.items[itemIndex]
        let oldItemPrice = oldItem.discountedPrice ?? oldItem.price
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
