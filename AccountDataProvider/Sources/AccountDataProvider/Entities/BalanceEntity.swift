//
//  BalanceEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct BalanceEntity: Decodable, Equatable {
    
    public let balanceWithoutPennies: Int
    public let balancePennies: Int
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let balance = try container.decode(Double.self)
        self.balanceWithoutPennies =  Int(balance)
        self.balancePennies = Int(balance.truncatingRemainder(dividingBy: 1)*100)
    }
    
}
