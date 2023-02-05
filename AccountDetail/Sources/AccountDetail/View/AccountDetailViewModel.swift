//
//  AccountDetailViewModel.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import AccountDataProvider
import Combine
import SwiftUI
import Module

class AccountDetailViewModel: ObservableObject {
    
    enum Tab {
        case info
        case transactions
    }
    
    private let dateFormater: DateFormatter
    
    @Published
    private(set) var accountDetail: AccountDetailDto?
    
    @Published
    private(set) var accountTransactions: [TransactionDto] = []
    
    @Published
    private(set) var selectedTab: Tab?
    
    init(service: AccountDetailService, accountNumber: String) {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.YYYY hh:mm"
        self.dateFormater = dateFormater
                
        $selectedTab
            .filter { $0 == .info }
            .map { _ in accountNumber }
            .flatMap(service.getAccountDetail(accountNumber:))
            .map(AccountDetailViewModel.entityToDto)
            .map { $0 as AccountDetailDto? }
            .catch { _ in Just(nil) }
            .receive(on: DispatchQueue.main)
            .assign(to: &$accountDetail)
        
        $selectedTab
            .filter { $0 == .transactions }
            .map { _ in accountNumber }
            .flatMap(service.getAccountTransactions(accountNumber:))
            .map { $0.transactions }
            .catch { _ in Just([]) }
            .map { AccountDetailViewModel.transactionsToDto(transactions: $0, dateFormater: dateFormater) }
            .receive(on: DispatchQueue.main)
            .assign(to: &$accountTransactions)
         
    }
    
    func select(_ tab: Tab) {
        selectedTab = tab
    }
            
    private static func entityToDto(accountDetailEntity: AccountDetailEntity) -> AccountDetailDto {
        return AccountDetailDto(name: accountDetailEntity.name, accountNumber: accountDetailEntity.accountNumber, iban: accountDetailEntity.iban, balanceWithoutPennies: "\(accountDetailEntity.balance.balanceWithoutPennies)", balancePennies: "\(accountDetailEntity.balance.balancePennies)", currency: accountDetailEntity.currency?.currencySymbol)
    }
    
    private static func transactionsToDto(transactions: [AccountTransactionEntity], dateFormater: DateFormatter) -> [TransactionDto] {
        return transactions.map { TransactionDto(dueDate: dateFormater.string(from: $0.dueDate), typeDescription: $0.typeDescription, amount: $0.amount.value, currency: $0.amount.currency.currencySymbol) }
    }
    
}
