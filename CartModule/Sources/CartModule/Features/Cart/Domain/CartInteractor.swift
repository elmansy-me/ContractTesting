//
//  File.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
public protocol CartInteractor {
    var cartBadgeInfo: AnyPublisher<CartBadgeInfo, Never> { get }
    func addItem(item: CartItem)
    func removeLastItem()
    var totalPrice: Double { get }
}
