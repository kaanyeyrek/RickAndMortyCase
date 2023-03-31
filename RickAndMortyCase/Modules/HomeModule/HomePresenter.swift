//
//  HomePresenter.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    // Dependencys
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    private var presentation: [CharacterPresentation] = []
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
//MARK: - LifeCycle
    func load() {
        interactor.load()
        if presentation.isEmpty {
            view?.handleOutput(.showEmptyView("Select location!"))
        } else {
            view?.handleOutput(.removeEmptyView)
        }
    }
    func didTappedCategoryButton(with ids: [String]) {
        interactor.showSelectedLocationCharacters(with: ids)
    }
    func selectedCharacter(at index: Int) {
        interactor.selectedCharacter(at: index)
    }
    func loadNextLocationPage() {
        interactor.getNextLocation()
    }
}
//MARK: - HomeInteractor Delegate / Handling HomeInteractorOutput
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .showCategoryLocations(let location):
            let locationPresentation = location.map {HomePresentation(model: $0)}
            view?.handleOutput(.showLocations(locationPresentation))
        case .showSelectedLocations(let characters):
            let showMultipleCharactersPresentation = characters.map {CharacterPresentation(model: $0)}
            view?.handleOutput(.showMultipleCharacters(showMultipleCharactersPresentation))
            self.presentation = showMultipleCharactersPresentation
        case .showSelectedCharacter(let selectedCharacter):
            router.navigate(to: .detail(selectedCharacter))
        case .showNextCategoryLocations(let locations):
            let nextPageLocations = locations.map { HomePresentation(model: $0)}
            view?.handleOutput(.showNextPageLocations(nextPageLocations))
        case .setLoading(let loading):
            view?.handleOutput(.setLoading(loading))
        }
    }
}
