//
//  AccountListEntity.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public struct AccountListEntity: Decodable {
    
    let pageNumber: Int
    let pageSize: Int
    let pageCount: Int
    let nextPage: Int?
    let recordCount: Int
    public let accounts: [AccountEntity]

}
