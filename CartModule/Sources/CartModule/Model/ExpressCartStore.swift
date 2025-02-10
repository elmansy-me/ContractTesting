//
//  ExpressCartStore.swift
//  CartModule
//
//  Created by Pavlo Bilohaienko on 06.02.2025.
//

public protocol ExpressCartStore: Sendable {
    var id: String { get }
    var localizedName: String { get }
    var minimumOrder: Double { get }
    var currency: String { get }
}
