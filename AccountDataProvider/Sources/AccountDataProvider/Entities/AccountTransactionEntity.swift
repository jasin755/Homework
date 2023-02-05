//
//  AccountTransactionEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct AccountTransactionEntity: Decodable, Equatable {
    
    public let dueDate: Date
    public let typeDescription: String
    public let sender: SubjectEntity
    public let receiver: SubjectEntity
    public let amount: AmountEntity
    
}
