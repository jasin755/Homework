//
//  AccountDetailRepository.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import AccountDataProvider
import Combine

class AccountDetailRepository {
 
    private let accountDataProvider: AccountDataProvider
    
    init(accountDataProvider: AccountDataProvider) {
        self.accountDataProvider = accountDataProvider
    }
    
    func getAccountDetail(accountNumber: String) -> AnyPublisher<AccountDetailEntity, AccountDataProviderError> {
        return accountDataProvider.getAccountDetail(accountNumber: accountNumber)
    }
    
    func getAccountTransactions(accountNumber: String) -> AnyPublisher<AccountsTransactionsEntity, AccountDataProviderError>  {
        return accountDataProvider.getAccountTransactions(accountNumber: accountNumber)
    }
    
}
