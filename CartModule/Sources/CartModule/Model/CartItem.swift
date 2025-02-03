//
//  CartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

public protocol CartItem {
    var id: String { get }
    var price: Double { get }
}
