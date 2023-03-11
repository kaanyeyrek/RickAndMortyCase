//
//  HomePresenter.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
//MARK: - HomeInteractor Delegate
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        
    }
}
