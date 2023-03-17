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
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func load() {
        interactor.load()
    }
    func didTappedCategoryButton(with ids: [String]) {
        interactor.showSelectedLocationCharacters(with: ids)
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
          break
        }
    }
}
