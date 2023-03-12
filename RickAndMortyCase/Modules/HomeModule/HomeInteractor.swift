//
//  HomeInteractor.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    //delegation
    weak var delegate: HomeInteractorDelegate?
    
    init() {
        
    }
}
