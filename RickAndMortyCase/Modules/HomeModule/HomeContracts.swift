//
//  HomeContracts.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import Foundation

//MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func load()
    func fetchCategoryLocations()
}
enum HomeInteractorOutput {
    case showCategoryLocations([Locations])
}
protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
   func load()
}
enum HomePresenterOutput {
    case showLocations([HomePresentation])
}
//MARK: - View
protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}
//MARK: - Router
enum HomeRoute {
    
}
protocol HomeRouterProtocol {
    func navigate(to route: HomeRoute)
}

