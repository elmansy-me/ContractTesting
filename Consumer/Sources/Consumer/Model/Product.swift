//
//  Product.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

struct Product: MarketplaceSellingItem {
    let id: String
    let name: String
    let price: Double
    let discountedPrice: Double?
    let currency: String
    let maxQuantity: Int
    let imageURL: String
  
    var localizedName: String {
        name
    }
}
