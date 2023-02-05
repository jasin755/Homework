//
//  AccountDataProviderRepository.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation
import Alamofire
import Combine

class AccountDataProviderRepository {
    
    private class ISODateFormatter: DateFormatter {

        override init() {
            super.init()

            calendar = Calendar(identifier: .iso8601)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func parse(from string: String) throws -> Date {

            dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            if let date = date(from: string) {
                return date
            }

            throw NSError(domain: "CSAS", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse date from invalid format."])
        }

        override func string(from date: Date) -> String {
            dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return super.string(from: date)
        }
    }
            
    private let baseUrl: URL
    private let requestQueue = DispatchQueue(label: "com.csas.response-queue", qos: .background, attributes: [.concurrent])
    private let session: Session
    private let decoder: JSONDecoder
    private static let dateFormatter = ISODateFormatter()
    
    init() {
        self.baseUrl = URL(string: "https://webapi.developers.erstegroup.com/api/csas/public/sandbox/v3")!
        self.session = Session()
        self.session.session.configuration.requestCachePolicy = .returnCacheDataElseLoad
        self.session.session.configuration.urlCache = URLCache.shared
        self.session.session.configuration.httpCookieStorage = HTTPCookieStorage.shared
        
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            return try AccountDataProviderRepository.dateFormatter.parse(from: dateStr)
        })
        
    }
    
    private func createAbsoluteUrl(with endPoint: String) -> URL {
        return baseUrl.appendingPathComponent(endPoint)
    }
    
    private func createBasicHeaders() -> HTTPHeaders {
        return ["WEB-API-key": "4d2c7469-b707-43af-8fdb-c985e419dc01"]
    }
    
    
    private func request<T: Decodable>(endPoint: String, method: HTTPMethod = .get, params: [String: Any]? = nil) -> AnyPublisher<T, AccountDataProviderError> {
        
        let absoluteUrl = createAbsoluteUrl(with: endPoint)
        
        return AF.request(absoluteUrl, method: method, parameters: params, headers: createBasicHeaders())
            .validate()
            .publishDecodable(type: T.self, decoder: decoder)
            .value()
            .mapError { AccountDataProviderError(originalError: $0) }
            .eraseToAnyPublisher()
    }
    

    func getAccountList() -> AnyPublisher<AccountListEntity, AccountDataProviderError> {
        return request(endPoint: "transparentAccounts")
    }
    
    func getAccountDetail(accountNumber: String) -> AnyPublisher<AccountDetailEntity, AccountDataProviderError> {
        return request(endPoint: "transparentAccounts/\(accountNumber)")
    }
    
    func getAccountTransactions(accountNumber: String) -> AnyPublisher<AccountsTransactionsEntity, AccountDataProviderError>  {
        return request(endPoint: "transparentAccounts/\(accountNumber)/transactions")
    }
    
}
