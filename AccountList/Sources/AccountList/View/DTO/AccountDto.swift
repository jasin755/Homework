//
//  File.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation


struct AccountDto: Equatable {
    
    let accountNumber: String
    let name: String
    let balanceWithoutPennies: String
    let balancePennies: String
    let currency: String?

    
}
