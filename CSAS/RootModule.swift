//
//  RootModule.swift
//  CSAS
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Swinject
import Module

class RootModule {
    
    static let instance = RootModule(assembler: Assembler())

    private let assembler: Assembler
    
    required init(assembler: Assembler) {
        self.assembler = assembler
        self.assembler.apply(assembly: RootAssembly(rootAssembler: assembler))
    }
    
    func getModule<T>(_ type: T.Type) -> T {
        return assembler.resolver.resolveType(type)
    }
        
}

