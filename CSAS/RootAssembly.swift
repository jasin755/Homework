//
//  RootAssembly.swift
//  CSAS
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import AppNavigator
import Module
import AccountDataProvider
import AccountList
import AccountDetail

class RootAssembly: Assembly {
    
    private let rootAssembler: Assembler
    
    init(rootAssembler: Assembler) {
        self.rootAssembler = rootAssembler
    }
    
    func assemble(container: Container) {
        container.register(Assembler.self) { _ in
            return self.rootAssembler
        }.inObjectScope(.container)
        
    
        container.autoregister(AppNavigator.self, initializer: AppNavigator.init).inObjectScope(.container)
        container.autoregister(AccountDataProvider.self, initializer: AccountDataProvider.init).inObjectScope(.container)
        
        
        
        container.register(Navigator.self) { r in
            return r.resolve(AppNavigator.self)! as any Navigator
        }
        
        container.autoregister(AccountList.self, initializer: AccountList.init)
        container.autoregister(AccountDetail.self, initializer: AccountDetail.init)
    }
    
}
