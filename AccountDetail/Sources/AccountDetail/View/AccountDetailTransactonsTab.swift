//
//  AccountDetailTransactonsTab.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Styles

public struct AccountDetailTransactonsTab: View {
    
    private let transactions: [TransactionDto]
    
    init(transactions: [TransactionDto]) {
        self.transactions = transactions
    }
    
    public var body: some View {
                
        ForEach(transactions, id: \.uniqueId) { transaction in
            HStack(alignment:.center) {
                Image("bank_account_icon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(8)
                
                VStack(alignment: .leading) {
                    Text(transaction.dueDate)
                        .font(.system(size: 14))
                        .foregroundColor(CSASColors.blueSecondary)
                        
                    
                    Text(transaction.typeDescription)
                        .font(.system(size: 17))
                        .foregroundColor(CSASColors.bluePrimary)
                    
                    HStack {
                        Spacer()
                        Text("\(transaction.amount, specifier: "%.02f") \(transaction.currency)")
                            .font(.system(size: 17))
                            .foregroundColor(CSASColors.bluePrimary)
                    }
                    
                }
            }
            
        }
    }
    
}
