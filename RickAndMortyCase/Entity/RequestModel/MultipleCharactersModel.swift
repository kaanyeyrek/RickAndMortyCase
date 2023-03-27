//
//  MultipleCharactersModel.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/17/23.
//

import Foundation

struct MultipleCharactersModel: Decodable {
    let characters: [Character]
}
struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let created: String
}
struct Location: Codable {
    let name: String
    let url: String
}
