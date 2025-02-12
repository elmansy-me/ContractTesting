//
//  ExpressProduct.swift
//  CartModule
//
//  Created by Pavlo Bilohaienko on 10.02.2025.
//

struct ExpressProduct: ExpressSellingItem {
    let id: String
    let name: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
}
