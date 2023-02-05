//
//  AccountDetailEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct AccountDetailEntity: Decodable {
    
    public let accountNumber: String
    public let bankCode: String
    public let balance: BalanceEntity
    public let currency: CurrencyEntity?
    public let name: String
    public let description: String
    public let iban: String
    
}
