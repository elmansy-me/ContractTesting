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
    var cartBadgeView: AnyPublisher<AnyView, Never> { get }
    func addItem(item: ConsumerCartItem)
    func removeLastItem()
}
