//
//  ExpressCartItemModel.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

struct ExpressCartItemModel: ExpressCartItem {
    let id: String
    let sellingItem: any ExpressSellingItem
    let quantity: Int
}
