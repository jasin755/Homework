//
//  AmountEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct AmountEntity: Decodable, Equatable {
    public let value: Double
    public let currency: CurrencyEntity
}
