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
    
    var cartBadgeInfo: AnyPublisher<any CartBadgeInfo, Never> {
        $_cartBadgeInfo
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    @Published private var _cartBadgeInfo: CartBadgeInfo?
    
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
            _cartBadgeInfo = CartBadgeInfoModel(shouldAppear: false, totalPrice: 0)
            return
        }
        print("🔥 CartModule: Updating cart badge to content state.")
        _cartBadgeInfo = CartBadgeInfoModel(shouldAppear: true, totalPrice: totalPrice)
    }
    
}
