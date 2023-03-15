//
//  RMService.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation

protocol RMServiceInterface {
    func fetchLocation(endPoint: RMEndpoint, completion: @escaping (Result<RMModel, NetworkError>) -> Void)
}

final class RMService: RMServiceInterface {
 
    private let coreService: CoreServiceProtocol
    
    init(coreService: CoreServiceProtocol) {
        self.coreService = coreService
    }
    
    func fetchLocation(endPoint: RMEndpoint, completion: @escaping (Result<RMModel, NetworkError>) -> Void) {
        coreService.fetch(endPoint: endPoint) { (result: Result<RMModel, NetworkError>) in
            completion(result)
        }
    }
}
