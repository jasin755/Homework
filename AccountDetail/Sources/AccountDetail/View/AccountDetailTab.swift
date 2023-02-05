//
//  AccountDetailTabView.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Styles


public struct AccountDetailTabView: View {
    
    private let accountName: String
    private let accountNumber: String
    private let iban: String
    
    init(accountName: String, accountNumber: String, iban: String) {
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.iban = iban
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AccountDetailTabViewCell(label: "Majitel účtu", value: accountName)
            Divider()
            AccountDetailTabViewCell(label: "Číslo účtu", value: accountNumber)
            Divider()
            AccountDetailTabViewCell(label: "IBAN", value: iban)
        }
        
    }
    
}


struct AccountDetailTabViewCell: View {
    
    
    private let label: String
    private let value: String
    
    init(label: String, value: String) {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(CSASColors.blueSecondary)
                
                Text(value)
                    .font(.system(size: 14))
                    .foregroundColor(CSASColors.bluePrimary)
            }
        }
    }
}
