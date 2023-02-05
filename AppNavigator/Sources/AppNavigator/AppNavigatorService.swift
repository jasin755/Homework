//
//  AppNavigatorService.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Swinject
import Module

class AppNavigatorService {
    
    private var registeredView: [String: AnyModuleType] = [:]
    private var registeredView1: [String: AnyModuleType1] = [:]

    func registerView<T, ViewType>(name: String, module: T, view: @escaping (T) -> () -> ViewType?) where ViewType: View {
        registeredView[name] = AnyModuleType(module: module, builder: view)
    }
    
    func registerView<T, Param1, ViewType>(name: String, module: T, view: @escaping (T) -> (Param1) -> ViewType?) where ViewType: View {
        registeredView1[name] = AnyModuleType1(module: module, builder: view)
    }
    
    func getView(name: String) -> AnyView? {
        guard let anyModule = registeredView[name] else {
            return cannotFindViewForName(name: name)
        }
        
        return anyModule.getView()
    }

    func getView<Param1>(name: String, param: Param1) -> AnyView? {
        
        guard let anyModule = registeredView1[name] else {
            return cannotFindViewForName(name: name)
        }
        
        return anyModule.getView(argument: param)
    }
    
    private func cannotFindViewForName(name: String) -> AnyView {
        return AnyView(Text("Cannot find any view for name: \(name)"))
    }

}
