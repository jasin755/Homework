//
//  AccountListService.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Combine
import AccountDataProvider

class AccountListService {
    
    private let repository: AccountListRepository
    
    init(repository: AccountListRepository) {
        self.repository = repository
    }
    
    func getAccountList() -> AnyPublisher<AccountListEntity, AccountDataProviderError> {
        return repository.getAccountList()
    }
    
}
