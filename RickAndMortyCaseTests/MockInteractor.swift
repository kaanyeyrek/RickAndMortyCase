//
//  MockInteractor.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/5/23.
//

import Foundation
@testable import RickAndMortyCase

final class MockInteractor: HomeInteractorProtocol {
    
    var invokedGetDataCount: Int = 0
    var invokedGetData: Bool = false
    var invokedFetchDataCount = 0
    var invokedFetchData: Bool = false
    var selectedIds: [String]?
    var selectedCharacterIndex: Int?
    var invokedScrollPagination = false
    var invokedScrollPaginationCount = 0
    
    var delegate: RickAndMortyCase.HomeInteractorDelegate?
    
    func load() {
        invokedGetData = true
        invokedGetDataCount += 1
    }
    func fetchCategoryLocations() {
        invokedFetchData = true
        invokedFetchDataCount += 1
    }
    func showSelectedLocationCharacters(with ids: [String]) {
        selectedIds = ids
    }
    func selectedCharacter(at index: Int) {
        selectedCharacterIndex = index
    }
    func getNextLocation() {
        invokedScrollPagination = true
        invokedScrollPaginationCount += 1
    }
}
