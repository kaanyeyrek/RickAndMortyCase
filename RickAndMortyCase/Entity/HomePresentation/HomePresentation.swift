//
//  HomePresentation.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation
// presentation object for direct communication for view 
final class HomePresentation {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    init(model: Locations) {
        self.id = model.id
        self.name = model.name
        self.type = model.type
        self.dimension = model.dimension
        self.residents = model.residents
        self.created = model.created
        self.url = model.url
    }
}
