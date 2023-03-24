//
//  HomeDetailPresenter.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/22/23.
//

import Foundation

final class HomeDetailPresenter: HomeDetailPresenterProtocol {
    
    private weak var view: HomeDetailViewProtocol?
    private let intereactor: HomeDetailInteractorProtocol
    private let selectedModel: Character
    
    init(selectedModel: Character, view: HomeDetailViewProtocol, interactor: HomeDetailInteractorProtocol) {
        self.selectedModel = selectedModel
        self.view = view
        self.intereactor = interactor
    }
    
    func load() {
        intereactor.load()
        view?.updatePresenter(with: CharacterPresentation(model: selectedModel))
    }
}
//MARK: - HomeDetailInteractorDelegate Output
extension HomeDetailPresenter: HomeDetailInteractorDelegate {
    func handleOutput(with output: HomeDetailInteractorOutput) {
        
    }
}
