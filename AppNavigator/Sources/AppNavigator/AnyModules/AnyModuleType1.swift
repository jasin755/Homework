//
//  AnyModuleType1.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Module

class AnyModuleType1 {

    private let _getView: (Any) -> AnyView?

    init<T, ParamType, ViewType: View>(module: T, builder: @escaping (T) -> (ParamType) -> ViewType?) {
        _getView = { param in
            guard let param = param as? ParamType else {
                let message = "Cannot find any view builder for module: \(T.self) with argument of type: \(param.self)"
                return AnyView(Text(message))
            }
            return AnyView(builder(module)(param))
        }
    }

    func getView<ParamType>(argument: ParamType) -> AnyView? {
        return _getView(argument)
    }
}
