//
//  AccountListViewModel.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Module
import Combine
import AccountDataProvider
import SwiftUI

public class AccountListViewModel: ObservableObject {
    
    private let navigator: Navigator
    
    @Published
    private(set) var accounts: [AccountDto] = []
    
    init(service: AccountListService, navigator: Navigator) {
    
        self.navigator = navigator
        
        service
            .getAccountList()
            .map { $0.accounts }
            .map(AccountListViewModel.accountEntitiesToDto)
            .catch{ _ in Just([]) }
            .receive(on: DispatchQueue.main)
            .assign(to: &$accounts)
    }
    
    func showDetail(account: AccountDto) -> AnyView? {
        return navigator.show(destinationName: "accountDetail", param: account.accountNumber)
    }
    
    func share(account: AccountDto) {
        print("pes")
    }
    
    private static func accountEntitiesToDto(accountEntity: [AccountEntity]) -> [AccountDto] {
        
        
        
        return accountEntity
            .map { accountEntity in
                return AccountDto(accountNumber: accountEntity.accountNumber, name: accountEntity.name,balanceWithoutPennies: "\(accountEntity.balance.balanceWithoutPennies)", balancePennies: "\(accountEntity.balance.balancePennies)", currency: accountEntity.currency?.currencySymbol)
            }
        
    }
    
}
