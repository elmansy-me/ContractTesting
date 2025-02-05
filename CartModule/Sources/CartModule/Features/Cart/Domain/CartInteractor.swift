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
    var cartBadgeView: () -> any View { get }

    func addItem(_ item: CartItem)
    func removeItem(_ item: CartItem)
}
