//
//  RMEndpoint.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation

enum RMEndpoint: HTTPEndpoint {
    
    case getLocations(page: Int)
    
    var path: String {
        return Path.location
    }
    var query: [URLQueryItem] {
        switch self {
        case .getLocations(let page):
            return [URLQueryItem(name: "page", value: String(page))]
        }
    }
}
