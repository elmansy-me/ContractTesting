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
    
    @Published private var _view: AnyView = AnyView(Text("CartInteractorImpl"))
    
    var view: AnyPublisher<AnyView, Never> {
        $_view.eraseToAnyPublisher()
    }
    
    private var items: [any CartItem] = []
    
    func addItem(item: any CartItem) {
        items.append(item)
        print("🔥 CartModule: CartItem has been added successfully.")
        updateCartBadgeView()
    }
    
    func removeLastItem() {
        guard !items.isEmpty else { return }
        items.removeLast()
        print("🔥 CartModule: CartItem has been removed successfully.")
        updateCartBadgeView()
    }
    
    var totalPrice: Double {
        items.map { $0.price }.reduce(0, +)
    }
    
    private func updateCartBadgeView() {
        guard !items.isEmpty else {
            print("🔥 CartModule: Updating cart badge to empty state.")
            _view = AnyView(Text("Cart is empty"))
            return
        }
        print("🔥 CartModule: Updating cart badge to content state.")
        _view = AnyView(Text("Total: \(totalPrice, specifier: "%.2f") $"))
    }
    
}
