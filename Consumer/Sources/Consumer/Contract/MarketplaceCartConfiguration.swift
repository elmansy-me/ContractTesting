//
//  MarketplaceCartConfiguration.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

// Proposal to consider: FFs (from Consumer end). Example:
// - is_Marketplace_Cart_Recommended_Items_Enables

public enum MarketplaceCartConfiguration: CaseIterable, Sendable {
    case recommendedItemsVisible
    case addressChanging
}
