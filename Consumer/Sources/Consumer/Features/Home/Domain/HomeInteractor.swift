//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
protocol HomeInteractor {
    var cartBadgeView: AnyPublisher<AnyView, Never> { get }
    func addRandomProduct()
    func removeRandomProduct()
}
