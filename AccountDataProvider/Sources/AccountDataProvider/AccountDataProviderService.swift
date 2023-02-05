//
//  AccountDataProviderService.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Combine
import Alamofire

class AccountDataProviderService {
    
    private let repository: AccountDataProviderRepository
    
    init(repository: AccountDataProviderRepository) {
        self.repository = repository
    }
    
    
    func getAccountList() -> AnyPublisher<AccountListEntity, AccountDataProviderError> {
        return repository.getAccountList()
    }
    
    func getAccountDetail(accountNumber: String) -> AnyPublisher<AccountDetailEntity, AccountDataProviderError> {
        return repository.getAccountDetail(accountNumber: accountNumber)
    }
    
    func getAccountTransactions(accountNumber: String) -> AnyPublisher<AccountsTransactionsEntity, AccountDataProviderError>  {
        return repository.getAccountTransactions(accountNumber: accountNumber)
    }
    
}
