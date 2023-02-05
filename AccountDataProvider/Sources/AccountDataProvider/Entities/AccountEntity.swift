//
//  AccountEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct AccountEntity: Decodable, Equatable {
        
    public let accountNumber: String
    public let bankCode: String
    public let balance: BalanceEntity
    public let currency: CurrencyEntity?
    public let name: String
    public let iban: String
            
}
