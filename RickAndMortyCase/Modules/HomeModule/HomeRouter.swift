//
//  HomeRouter.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    func navigate(to route: HomeRoute) {
       
    }
}
