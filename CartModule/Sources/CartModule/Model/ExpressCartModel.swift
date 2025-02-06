//
//  ExpressCartModel.swift
//  CartModule
//
//  Created by Pavlo Bilohaienko on 06.02.2025.
//

import Foundation

struct ExpressCartModel: ExpressCart {
    let id: String
    let store: any ExpressCartStore
    var items: [any ExpressCartItem]
}
