//
//  CurrencyEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public enum CurrencyEntity: String, Decodable {
    case CZK
    
    public var currencySymbol: String {
        switch self {
        case .CZK:
            return "Kč"
        }
    }
    
}
