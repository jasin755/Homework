import Foundation
import Swinject
import SwiftUI
import Module

public class AccountList {
    
    private let assembler: Assembler
    private let navigator: Navigator
    
    public required init(assembler: Swinject.Assembler, navigator: Navigator) {
        self.assembler = assembler
        self.navigator = navigator
        self.assembler.apply(assembly: AccountListAssembly())
    }
    
    
    public func getView() -> AccountListView {
        let accountListViewModel = AccountListViewModel(service: assembler.resolver.resolveType(), navigator: navigator)
        return AccountListView(viewModel: accountListViewModel)
    }
    
}
