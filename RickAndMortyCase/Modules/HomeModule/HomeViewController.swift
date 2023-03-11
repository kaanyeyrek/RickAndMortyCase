//
//  ViewController.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
//MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput) {
        
    }
}

