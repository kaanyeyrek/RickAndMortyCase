//
//  RMEndpoint.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation

enum RMEndpoint: HTTPEndpoint {
    
    case getLocations(page: Int)
    case getMultipleCharacters(ids: [String])
    
    var path: String {
        switch self {
        case .getMultipleCharacters(let ids):
            return "/api/character/\(ids.joined(separator: ","))"
        case .getLocations:
            return Path.location.rawValue
        }
    }
    var query: [URLQueryItem]? {
        switch self {
        case .getLocations(let page):
            return [URLQueryItem(name: "page", value: String(page))]
        case .getMultipleCharacters(_):
           return nil 
        }
    }
}
