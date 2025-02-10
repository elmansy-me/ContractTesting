//
//  File.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

import Foundation

public protocol MarketplaceStore: Identifiable, Sendable {
    var id: String { get }
    var localizedName: String { get }
    var minimumOrder: Double { get }
    var currency: String { get }
    // TODO: To add optional offer info here (not supported in MVP from MP end).
}
