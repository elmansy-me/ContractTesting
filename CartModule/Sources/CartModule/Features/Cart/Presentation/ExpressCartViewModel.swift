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
  
    func loadCart(forStoreID storeID: String) -> ExpressCartModel {
        let store = ExpressCartStoreModel(id: storeID, localizedName: "Store \(storeID)")
        let cartModel = ExpressCartModel(id: "FD863335-74B2-4CB5-B9C8-92568C2C7D50", store: store, items: [])
        self.cartModel = cartModel
        return cartModel
    }
  
    func clearCart() {
        cartModel = nil
    }
  
//    func addItem(_ item: any ExpressCartItem, toCart cart: any ExpressCart) -> any ExpressCart {
//      guard cart.id == cartModel?.id else {
//          throw NSError()
//      }
//      if cartModel?.items.contains(where: { item.id == $0.id }) {
//        
//      } else {
//        cartModel?.items.append(item)
//      }
//    }
  
      func addItemPrice(_ price: Double) throws -> ExpressCartModel {
          guard let cartModel else {
            throw NSError()
          }
        
          totalPrice += price
          return cartModel
      }
  
      func updateItemPrice(_ price: Double) throws -> ExpressCartModel {
          guard let cartModel else {
            throw NSError()
          }
        
          totalPrice += price
          return cartModel
      }
    
      func substractItemPrice(_ price: Double) throws -> ExpressCartModel {
          guard let cartModel else {
            throw NSError()
          }
        
          if totalPrice >= price {
              totalPrice -= price
              return cartModel
          }
          return cartModel
      }
}
