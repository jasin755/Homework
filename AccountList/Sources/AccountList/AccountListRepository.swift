//
//  AccountListRepository.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import AccountDataProvider
import Combine

class AccountListRepository {
    
    private let accountDataProvider: AccountDataProvider
    
    init(accountDataProvider: AccountDataProvider) {
        self.accountDataProvider = accountDataProvider
    }
    
    func getAccountList() -> AnyPublisher<AccountListEntity, AccountDataProviderError> {
        return accountDataProvider.getAccountList()
    }
    

}
