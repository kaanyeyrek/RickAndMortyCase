//
//  HomeBuilder.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import Foundation
//MARK: - Custom assembly vc 
final class HomeBuilder {

    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let router = HomeRouter(view: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, interactor: interactor, router: router)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
