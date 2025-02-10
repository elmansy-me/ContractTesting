//
//  ExpressCartItemModel.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

struct ExpressCartItemModel: ExpressCartItem {
    let id: String
    let name: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
    let quantity: Int
}
