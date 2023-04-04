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
    
    func handleOutput(_ output: RickAndMortyCase.HomePresenterOutput) {
        outputs.append(output)
    }

}
