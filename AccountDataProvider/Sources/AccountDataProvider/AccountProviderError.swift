//
//  AccountDataProviderError.swift
//  
//
//  Created by Nikolaj Pogněrebko on 04.02.2023.
//

import Foundation

public class AccountDataProviderError: Error {
    
    //TODO: Other errors
    
    public let originalError: Error
    
    init(originalError: Error) {
        self.originalError = originalError
    }
    
}
