//
//  MockHomeView.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/4/23.
//

import Foundation
@testable import RickAndMortyCase

final class MockHomeView: HomeViewProtocol {
    
    var outputs: [HomePresenterOutput] = []
    var presenter: HomePresenter!
    
    func handleOutput(_ output: RickAndMortyCase.HomePresenterOutput) {
            self.outputs.append(output)
    }
}
