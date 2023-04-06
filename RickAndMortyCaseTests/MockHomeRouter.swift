//
//  MockHomeRouter.swift
//  RickAndMortyCaseTests
//
//  Created by Kaan Yeyrek on 4/4/23.
//

import Foundation
@testable import RickAndMortyCase

final class MockHameRouter: HomeRouterProtocol {
    
    var routes: [HomeRoute] = []
    
    func navigate(to route: RickAndMortyCase.HomeRoute) {
        routes.append(route)
    }
}
