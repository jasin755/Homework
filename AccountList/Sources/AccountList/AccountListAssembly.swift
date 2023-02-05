//
//  AccountListAssembly.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import Module

class AccountListAssembly: Assembly {
    
    
    func assemble(container: Container) {
        container.autoregister(AccountListService.self, initializer: AccountListService.init).inObjectScope(.container)
        container.autoregister(AccountListRepository.self, initializer: AccountListRepository.init).inObjectScope(.container)
    }

}
