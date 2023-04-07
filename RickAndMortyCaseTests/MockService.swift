//
//  MockService.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/5/23.
//

import Foundation
@testable import RickAndMortyCase

final class MockService: RMServiceInterface {
    
    // fetch location method trigger
    var invokedFetchLocation: Bool = false
    var invokedFetchLocationCount: Int = 0
    var locationsResponse: Result<RMModel, NetworkError>?

    func fetchLocation(endPoint: RickAndMortyCase.RMEndpoint, completion: @escaping (Result<RickAndMortyCase.RMModel, RickAndMortyCase.NetworkError>) -> Void) {
        invokedFetchLocation = true
        invokedFetchLocationCount += 1
        guard let response = locationsResponse else {
            completion(.failure(.badData))
            return
        }
        completion(response)
    }
    // invoked fetchMultipleCharacters method trigger
    var invokedFetchMultipleCharacters: Bool = false
    var invokedFetchMultipleCharactersCount: Int = 0
    var charactersResponse: Result<[Character], NetworkError>?

    func fetchMultipleCharacters(endPoint: RickAndMortyCase.RMEndpoint, completion: @escaping (Result<[RickAndMortyCase.Character], RickAndMortyCase.NetworkError>) -> Void) {
        invokedFetchMultipleCharacters = true
        invokedFetchMultipleCharactersCount += 1
        guard let response = charactersResponse else {
            completion(.failure(.badResponse))
            return
        }
        completion(response)
    }
}
