//
//  HomeBuilder.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/22/23.
//

import Foundation

final class HomeDetailBuilder {
    
    static func make(wih model: Character) -> HomeDetailViewController {
        let vc = HomeDetailViewController()
        let interactor = HomeDetailInteractor()
        let presenter = HomeDetailPresenter(selectedModel: model, view: vc, interactor: interactor)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
