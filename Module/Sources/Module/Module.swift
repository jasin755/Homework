import Swinject

public extension Resolver {
    func resolveType<Service>(_ serviceType: Service.Type) -> Service {
        return resolve(serviceType)!
    }
    
    func resolveType<Service>() -> Service {
        return resolve(Service.self)!
    }
    
}
