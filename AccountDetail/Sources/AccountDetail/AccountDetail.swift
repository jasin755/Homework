import Module
import Swinject

public class AccountDetail {
    
    private let assembler: Assembler
    
    public required init(assembler: Assembler, navigator: Navigator) {
        self.assembler = assembler
        self.assembler.apply(assembly: AccountDetailAssembly())
    }
    
    
    public func getView(accountNumber: String) -> AccountDetailView {
        let accountViewModel = AccountDetailViewModel(service: assembler.resolver.resolveType(), accountNumber: accountNumber)
        
        return AccountDetailView(viewModel: accountViewModel)
    }
    
}
