//
//  HomeRouter.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import UIKit
//MARK: - HomeRouter Interface
final class HomeRouter: HomeRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let character):
            let vc = HomeDetailBuilder.make(wih: character)
            view.show(vc, sender: nil)
        }
    }
}
