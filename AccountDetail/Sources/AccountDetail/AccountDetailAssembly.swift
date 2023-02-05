//
//  AccountListAssembly.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AccountDetailAssembly: Assembly {
    
        
    func assemble(container: Container) {
                
        container.autoregister(AccountDetailRepository.self, initializer: AccountDetailRepository.init).inObjectScope(.container)
        container.autoregister(AccountDetailService.self, initializer: AccountDetailService.init).inObjectScope(.container)
        
        container.autoregister(AccountDetailViewModel.self, initializer: AccountDetailViewModel.init)
        container.autoregister(AccountDetailView.self, initializer: AccountDetailView.init)
    
    }
        
}
