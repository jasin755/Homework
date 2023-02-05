import Foundation
import Swinject
import SwiftUI
import Module

public class AppNavigator: Navigator {
    
    private let assembler: Assembler
    
    public required init(assembler: Assembler) {
        self.assembler = assembler
        self.assembler.apply(assembly: AppNavigatorAssembly())
    }
    
    public func registerView<T, ViewType>(name: String, view: @escaping (T) -> () -> ViewType?) where ViewType: View {
        let service = assembler.resolver.resolveType(AppNavigatorService.self)
        if let module = assembler.resolver.resolve(T.self) {
            service.registerView(name: name, module: module, view: view)
        }
    }
    
    
    public func registerView<T, ViewType, Param1>(name: String, view: @escaping (T) -> (Param1) -> ViewType?) where ViewType: View {
        let service = assembler.resolver.resolveType(AppNavigatorService.self)
        if let module = assembler.resolver.resolve(T.self) {
            service.registerView(name: name, module: module, view: view)
        }
    }
    
    public func show(destinationName: String) -> AnyView? {
        return assembler.resolver.resolveType(AppNavigatorService.self).getView(name: destinationName)
    }
    
    public func show<Param1>(destinationName: String, param: Param1) -> AnyView? {
        return assembler.resolver.resolveType(AppNavigatorService.self).getView(name: destinationName, param: param)
    }
        
}
