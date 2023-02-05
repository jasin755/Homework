//
//  AppNavigatorAssembly.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AppNavigatorAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.autoregister(AppNavigatorService.self, initializer: AppNavigatorService.init).inObjectScope(.container)
    }
    
}

