//
//  RMService.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation

protocol RMServiceInterface {
    func fetchLocation(endPoint: RMEndpoint, completion: @escaping (Result<RMModel, NetworkError>) -> Void)
    func fetchMultipleCharacters(endPoint: RMEndpoint, completion: @escaping (Result<[Character], NetworkError>) -> Void)
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
    func fetchMultipleCharacters(endPoint: RMEndpoint, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        coreService.fetchArray(endPoint: endPoint) { (result: Result<[Character], NetworkError>) in
            switch result {
            case .success(let characters):
               let multipleCharacters = MultipleCharactersModel(characters: characters)
               completion(.success(multipleCharacters.characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
