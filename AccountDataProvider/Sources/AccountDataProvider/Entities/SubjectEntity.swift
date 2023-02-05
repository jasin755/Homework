//
//  SubjectEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct SubjectEntity: Decodable, Equatable {
    
    public let accountNumber: String
    public let bankCode: String
    public let iban: String
    public let constantSymbol: String?
    public let specificSymbol: String?
    public let specificSymbolParty: String?
    public let description: String?
    public let name: String?
    
}
