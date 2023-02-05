//
//  CSASApp.swift
//  CSAS
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import SwiftUI
import AppNavigator
import AccountList
import AccountDetail
import TestPackage

@main
struct CSASApp: App {
    
    private let navigator: AppNavigator
    
    init() {
        navigator = RootModule.instance.getModule(AppNavigator.self)
        
        navigator.registerView(name: "accountList", view: AccountList.getView)
        navigator.registerView(name: "accountDetail", view: AccountDetail.getView)
    }
    
    var body: some Scene {
        WindowGroup {
            navigator.show(destinationName: "accountList")
        }
    }
}
