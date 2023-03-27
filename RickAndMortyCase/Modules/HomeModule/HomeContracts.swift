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
    func showSelectedLocationCharacters(with ids: [String])
    func selectedCharacter(at index: Int)
    func getNextLocation()
    
}
enum HomeInteractorOutput {
    case showCategoryLocations([Locations])
    case showNextCategoryLocations([Locations])
    case showSelectedLocations([Character])
    case showSelectedCharacter(Character)
    case setLoading(Bool)
}
protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func load()
    func didTappedCategoryButton(with ids: [String])
    func selectedCharacter(at index: Int)
    func loadNextLocationPage()
}
enum HomePresenterOutput {
    case showLocations([HomePresentation])
    case showNextPageLocations([HomePresentation])
    case showMultipleCharacters([CharacterPresentation])
    case setLoading(Bool)
    case showEmptyView(String)
    case removeEmptyView
}
//MARK: - View
protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}
//MARK: - Router
enum HomeRoute {
    case detail(Character)
}
protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}

