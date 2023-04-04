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
    private var interactor: HomeInteractor!
    private var mockHomeView: MockHomeView!
    private var mockHomeRouter: MockHameRouter!

    override func setUp() {
     super.setUp()
        presenter = .init(view: mockHomeView, interactor: interactor, router: mockHomeRouter)
   
    }
    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenter = nil
        mockHomeView = nil
        mockHomeRouter = nil
    }
}
