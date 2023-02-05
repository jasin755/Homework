//
//  AccountListView.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import AccountDataProvider
import Styles

public struct AccountListView: View {
    
    @ObservedObject
    private var viewModel: AccountListViewModel
    
    init(viewModel: AccountListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        
    
        NavigationStack {

            ScrollView {
                ForEach(viewModel.accounts, id: \.accountNumber) { account in
                    
                    NavigationLink(destination: viewModel.showDetail(account: account)) {
                        AccountCellView(account: account)
                    }
                    
                }
                .animation(.easeInOut, value: viewModel.accounts)
                
            }
            .background(LinearGradient(colors: [CSASColors.bluePrimary, CSASColors.blueSecondary], startPoint: .top, endPoint: .bottom))
            .navigationBarTitle("Account list", displayMode: .large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        

    }
}


