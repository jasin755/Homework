//
//  AccountDetailService.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import AccountDataProvider
import Combine

class AccountDetailService {
    
    private let repository: AccountDetailRepository
    
    init(repository: AccountDetailRepository) {
        self.repository = repository
    }
    
    func getAccountDetail(accountNumber: String) -> AnyPublisher<AccountDetailEntity, AccountDataProviderError> {
        return repository.getAccountDetail(accountNumber: accountNumber)
    }
    
    public func getAccountTransactions(accountNumber: String) -> AnyPublisher<AccountsTransactionsEntity, AccountDataProviderError>  {
        return repository.getAccountTransactions(accountNumber: accountNumber)
    }
    
}
