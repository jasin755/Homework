//
//  TransactionDto.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

struct TransactionDto {
   
    var uniqueId: String {
        return "\(typeDescription)\(amount)\(currency)\(dueDate)"
    }
    
    let dueDate: String
    let typeDescription: String
    let amount: Double
    let currency: String
    

    
}
