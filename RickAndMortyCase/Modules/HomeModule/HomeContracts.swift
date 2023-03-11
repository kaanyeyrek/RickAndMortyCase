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
}
enum HomeInteractorOutput {
    
}
protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    
}
enum HomePresenterOutput {
    
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

