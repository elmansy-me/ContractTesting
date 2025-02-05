//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor public var contract: ConsumerContract?

@MainActor
public protocol ConsumerContract {
    var cartBadgeView: () -> any View { get }

    func addItem(item: any MarketplaceCartItem)
    func removeItem(item: any MarketplaceCartItem)
}
