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
    // TODO: To check if we need to pass minimum order here.
}
