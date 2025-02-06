//
//  ExpressCart.swift
//  CartModule
//
//  Created by Pavlo Bilohaienko on 06.02.2025.
//

public protocol ExpressCart: Sendable {
    var id: String { get }
    var store: any ExpressCartStore { get }
    var items: [any ExpressCartItem] { get set }
}
