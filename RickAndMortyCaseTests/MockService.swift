//
//  MockService.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/5/23.
//

import Foundation
@testable import RickAndMortyCase

final class MockService: RMServiceInterface {
    
    var shouldReturnError: Bool = false
    var locationsResponse: Result<RMModel, NetworkError>?
    var charactersResponse: Result<[Character], NetworkError>?
    
    func fetchLocation(endPoint: RickAndMortyCase.RMEndpoint, completion: @escaping (Result<RickAndMortyCase.RMModel, RickAndMortyCase.NetworkError>) -> Void) {
        if let response = locationsResponse {
            completion(response)
        } else if shouldReturnError {
            completion(.failure(.badData))
        }
    }
    func fetchMultipleCharacters(endPoint: RickAndMortyCase.RMEndpoint, completion: @escaping (Result<[RickAndMortyCase.Character], RickAndMortyCase.NetworkError>) -> Void) {
        if let response = charactersResponse {
            completion(response)
        } else if shouldReturnError {
            completion(.failure(.badData))
        }
    }
}
