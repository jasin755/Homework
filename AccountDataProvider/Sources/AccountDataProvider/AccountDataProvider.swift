import Module
import Swinject
import Combine

public class AccountDataProvider {
    
    private let assembler: Assembler
    
    public required init(assembler: Assembler) {
        self.assembler = assembler
        self.assembler.apply(assembly: AccountDataProviderAssembly())
    }
    
    
    public func getAccountList() -> AnyPublisher<AccountListEntity, AccountDataProviderError> {
        return assembler.resolver.resolveType(AccountDataProviderService.self)
            .getAccountList()
    }
    
    public func getAccountDetail(accountNumber: String) -> AnyPublisher<AccountDetailEntity, AccountDataProviderError> {
        return assembler.resolver.resolveType(AccountDataProviderService.self)
            .getAccountDetail(accountNumber: accountNumber)
    }
    
    public func getAccountTransactions(accountNumber: String) -> AnyPublisher<AccountsTransactionsEntity, AccountDataProviderError>  {
        return assembler.resolver.resolveType(AccountDataProviderService.self)
            .getAccountTransactions(accountNumber: accountNumber)
    }
    
}
