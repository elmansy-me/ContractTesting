//
//  ExpressCartItem.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

public protocol ExpressCartItem: Sendable {
    var id: String { get }
    var sellingItem: ExpressSellingItem { get } // Basically, a Product
    var quantity: Int { get }
}
