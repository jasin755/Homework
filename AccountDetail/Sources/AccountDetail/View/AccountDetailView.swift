//
//  AccountDetailView.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Styles

public struct AccountDetailView: View {
    
    @ObservedObject
    private var viewModel: AccountDetailViewModel
    
    init(viewModel: AccountDetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
                
        ScrollView {
                  
            if let account = viewModel.accountDetail {
                VStack() {
                                            
                    HStack(alignment: .top, spacing: 0) {
                        Text("\(account.balanceWithoutPennies),")
                            .fontWeight(.medium)
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
                        
                        Text(account.balancePennies)
                            .fontWeight(.medium)
                            .font(.system(size: 17))
                            .foregroundColor(Color.white)
                        
                        if let currency = account.currency {
                            Text(currency)
                                .fontWeight(.medium)
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        }
                        
                    }
                    
                    HStack {
                        
                        VStack {
                            Text("INFO")
                                .font(.system(size: 18))
                                .foregroundColor(viewModel.selectedTab == .info ? Color.white : Color.gray)
                                .onTapGesture {
                                    viewModel.select(.info)
                                }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                        Divider()
                            .tint(Color(.white))
                        
                        VStack {
                            Text("TRANSAKCE")
                                .font(.system(size: 18))
                                .foregroundColor(viewModel.selectedTab == .transactions ? Color.white : Color.gray)
                                .onTapGesture {
                                    viewModel.select(.transactions)
                                }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    .padding(8)
                    .background(CSASColors.darkRed)
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                .background(CSASColors.lightRed)
                .navigationBarTitle(account.name, displayMode: .large)
                
                if viewModel.selectedTab == .info {
                    AccountDetailTabView(accountName: account.name, accountNumber: account.accountNumber, iban: account.iban)
                        .padding(8)
                        .background(.white)
                } else {
                    AccountDetailTransactonsTab(transactions: viewModel.accountTransactions)
                        .padding(8)
                        .background(.white)
                }
            }
        
        }
        .background(CSASColors.grayPrimary)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CSASColors.lightRed, for: .navigationBar)
        .onAppear {
            viewModel.select(.info)
        }
    }
        
}
