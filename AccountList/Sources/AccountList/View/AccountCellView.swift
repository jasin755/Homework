//
//  AccountCellView.swift
//  
//
//  Created by Nikolaj Pogněrebko on 05.02.2023.
//

import Foundation
import SwiftUI
import Styles

public struct AccountCellView: View {
    
    private let account: AccountDto
    
    init(account: AccountDto) {
        self.account = account
    }
    
    public var body: some View {
        
      
        HStack(spacing: 0) {
            
            Divider()
                .frame(width: 4)
                .overlay(CSASColors.lightRed)
            
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    
                
                    Image("bank_account_icon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(8)
                    
                    VStack(alignment: .leading) {
                        Text(account.accountNumber)
                            .font(.system(size: 14))
                            .fontWeight(.light)
                            .foregroundColor(CSASColors.blueSecondary)
                        
                        Text(account.name)
                            .font(.system(size: 17))
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(CSASColors.bluePrimary)
                        
                        HStack(alignment: .top, spacing: 0) {
                            
                            Spacer()
                            
                            Text(account.balanceWithoutPennies)
                                .font(.system(size: 25))
                                .fontWeight(.medium)
                                .foregroundColor(CSASColors.greenPrimary)
                            
                            Text(",")
                                .font(.system(size: 25))
                                .fontWeight(.medium)
                                .foregroundColor(CSASColors.greenPrimary)
                            
                            Text(account.balancePennies)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(CSASColors.greenPrimary)
                            
                            
                            if let currency = account.currency {
                                Text(currency)
                                    .font(.system(size: 25))
                                    .fontWeight(.medium)
                                    .foregroundColor(CSASColors.greenPrimary)
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            }
                            
                        }
                    }.padding(16)
                    
                    
                }
                
                HStack {
                    Text("Detail")
                        .font(.system(size: 14))
                        .foregroundColor(CSASColors.blueTertiary)
                    Spacer()
                    
                    
                    ShareLink(item: "\(account.name) (\(account.accountNumber))") {
                        Image("share_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                   
                }
                .padding(16)
                .background(CSASColors.grayPrimary)
                
            }
        }
        .background(Color(.white))
        .cornerRadius(5)
        .padding(8)
    }
}
