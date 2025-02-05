//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI

@MainActor
protocol MarketplaceCartProvider {
    var cartBadgeView: () -> any View { get }

    func addItem(_ item: any MarketplaceCartItem) async throws
    func removeItem(_ item: any MarketplaceCartItem) async throws    
}
