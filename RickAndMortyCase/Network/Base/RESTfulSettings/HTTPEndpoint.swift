//
//  HTTPEndpoint.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [URLQueryItem] { get }
    var method: HTTPMethod { get }
}
extension HTTPEndpoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "rickandmortyapi.com"
    }
    var method: HTTPMethod {
        return .get
    }
}
