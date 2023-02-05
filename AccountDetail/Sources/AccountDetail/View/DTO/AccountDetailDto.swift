//
//  AccountDetailDto.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

struct AccountDetailDto {
    
    let name: String
    let accountNumber: String
    let iban: String
    let balanceWithoutPennies: String
    let balancePennies: String
    let currency: String?
    
}
