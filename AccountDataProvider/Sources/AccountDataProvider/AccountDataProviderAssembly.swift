//
//  AccountDataProviderAssembly.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AccountDataProviderAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.autoregister(AccountDataProviderRepository.self, initializer: AccountDataProviderRepository.init).inObjectScope(.container)
        container.autoregister(AccountDataProviderService.self, initializer: AccountDataProviderService.init).inObjectScope(.container)
        
    }
}
