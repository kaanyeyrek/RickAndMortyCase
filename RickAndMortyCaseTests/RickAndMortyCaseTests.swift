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
        mockService = MockService()
        interactor = MockInteractor()
        mockHomeView = MockHomeView()
        mockHomeRouter = MockHameRouter()
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
}

