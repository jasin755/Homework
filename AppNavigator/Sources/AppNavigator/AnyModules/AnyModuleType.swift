//
//  AnyModuleType.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI
import Module

class AnyModuleType {

    private let _getView: () -> AnyView?

    init<T, ViewType: View>(module: T, builder: @escaping (T) -> () -> ViewType?) {
        _getView = {
            return AnyView(builder(module)())
        }
    }

    func getView() -> AnyView? {
        return _getView()
    }
}

