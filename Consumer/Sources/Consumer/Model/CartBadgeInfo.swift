//
//  CartBadgeInfo.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

public protocol CartBadgeInfo {
    var shouldAppear: Bool { get }
    var totalPrice: Double { get }
}
