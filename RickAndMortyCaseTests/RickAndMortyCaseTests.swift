//
//  RickAndMortyCaseTests.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/4/23.
//

import XCTest
@testable import RickAndMortyCase

final class RickAndMortyCaseTests: XCTestCase {
    
    private var presenter: HomePresenter!
    private var interactor: MockInteractor!
    private var mockHomeView: MockHomeView!
    private var mockHomeRouter: MockHameRouter!
    private var mockService: MockService!
    
    override func setUp() {
        super.setUp()
        mockService = .init()
        interactor = .init()
        mockHomeView = .init()
        mockHomeRouter = .init()
        presenter = .init(view: mockHomeView, interactor: interactor, router: mockHomeRouter)
        mockHomeView.presenter = presenter
    }
    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenter = nil
        mockHomeView = nil
        mockHomeRouter = nil
        mockService = nil
    }
    func test_load_InvokeRequiredMethods() throws {
        // Given
        XCTAssertFalse(interactor.invokedGetData)
        XCTAssertEqual(interactor.invokedGetDataCount, 0)
         // When
        presenter.load()
         // Then
        XCTAssertTrue(interactor.invokedGetData)
        XCTAssertEqual(interactor.invokedGetDataCount, 1)        
     }
    func test_fetchCategoryLocation_Success() throws {
        XCTAssertFalse(interactor.invokedFetchData)
        XCTAssertEqual(interactor.invokedFetchDataCount, 0)
        
        interactor.fetchCategoryLocations()
    
        XCTAssertTrue(interactor.invokedFetchData)
        XCTAssertEqual(interactor.invokedFetchDataCount, 1)
    }
    func test_didTappedCategoryButton_CallService() throws {
       let selectedIds = ["1", "2", "3"]
        
        presenter.didTappedCategoryButton(with: selectedIds)
        
        XCTAssertEqual(interactor.selectedIds, selectedIds)
    }
    func test_didSelectItem_WithCharacters() {
        let expectedIndex = 3
        
        interactor.selectedCharacter(at: expectedIndex)
        
        XCTAssertEqual(interactor.selectedCharacterIndex, expectedIndex)
    }
    func test_scrollCategory_Pagination() {
        XCTAssertFalse(interactor.invokedScrollPagination)
        XCTAssertEqual(interactor.invokedScrollPaginationCount, 0)
        
        interactor.getNextLocation()
        
        XCTAssertTrue(interactor.invokedScrollPagination)
        XCTAssertEqual(interactor.invokedScrollPaginationCount, 1)
    }
    func test_serviceFetchCategoryLocation_Success() {
        mockService.locationsResponse = .success(RMModel(results: [Locations(id: 1, name: "test_name", type: "test_type", dimension: "test_dimension", residents: [], url: "test_url", created: "test_date")]))
        let expectedPage: Int = 1
        XCTAssertFalse(mockService.invokedFetchLocation)
        XCTAssertEqual(mockService.invokedFetchLocationCount, 0)
        
        mockService.fetchLocation(endPoint: .getLocations(page: expectedPage)) { result in
            
            XCTAssertTrue(self.mockService.invokedFetchLocation)
            XCTAssertEqual(self.mockService.invokedFetchLocationCount, 1)
                   
            switch result {
            case .success(let model):
                XCTAssertEqual(model.results.count, 1)
            case .failure(let error):
                XCTFail("Failure \(error.localizedDescription)")
            }
        }
    }
    func test_serviceFetchMultipleCharacters_Success() {
        mockService.charactersResponse = .success([Character(id: 1, name: "test_name", status: "test_status", species: "test_species", gender: "test_gender", origin: Location(name: "test_name", url: "test_url"), location: Location(name: "test_name", url: "test_Url"), image: "test_image", episode: [], created: "test_created")])
        let expectedId: [String] = ["test_name_id"]
        XCTAssertFalse(mockService.invokedFetchMultipleCharacters)
        XCTAssertEqual(mockService.invokedFetchMultipleCharactersCount, 0)
        
        mockService.fetchMultipleCharacters(endPoint: .getMultipleCharacters(ids: expectedId)) { result in
            XCTAssertTrue(self.mockService.invokedFetchMultipleCharacters)
            XCTAssertEqual(self.mockService.invokedFetchMultipleCharactersCount, 1)
            switch result {
            case .success(let model):
                XCTAssertEqual(model.count, 1)
            case .failure(let error):
                XCTFail("Failure \(error.localizedDescription)")
            }
        }
    }
}

