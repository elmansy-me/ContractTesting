//
//  ExpressCartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

public protocol ExpressCartItem: Sendable {
    var id: String { get }
    var name: String { get }
    var price: Double { get }
    var currency: String { get }
    var quantity: Int { get set }
}
