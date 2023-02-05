//
//  Navigator.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import SwiftUI

public protocol Navigator {
    
    func show(destinationName: String) -> AnyView?
    func show<Param1>(destinationName: String, param: Param1) -> AnyView?
    func show<Param1, Param2>(destinationName: String, param: Param1, param2: Param2) -> AnyView?
    
}

public extension Navigator {
    
    func show(destinationName: String) -> AnyView? {
        return nil
    }
    
    func show<Param1>(destinationName: String, param: Param1) -> AnyView? {
        return nil
    }
    
    func show<Param1, Param2>(destinationName: String, param: Param1, param2: Param2) -> AnyView? {
        return nil
    }
    
}

