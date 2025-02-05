//
//  File.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

class CartInteractorImpl: CartInteractor {
    private var items: [any CartItem] = []
    private lazy var cartViewModel = CartViewModel()
  
    var cartBadgeView: () -> any View {
      {
        CartView(viewModel: self.cartViewModel)
      }
    }
    
    func addItem(_ item: any CartItem) {
        items.append(item)
      
        print("🔥 CartModule: CartItem has been added successfully.")
        _ = cartViewModel.addItemPrice(item.price)
    }
    
    func removeItem(_ item: any CartItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
      
        if items[index].count == 1 {
          items.remove(at: index)
        } else {
          items[index].count -= 1
        }
      
        print("🔥 CartModule: CartItem has been removed successfully.")
        _ = cartViewModel.substractItemPrice(items.last!.price)
    }
}
