//
//  RMModel.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation
// default request model 
struct RMModel: Decodable {
    let results: [Locations]
}
struct Locations: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
