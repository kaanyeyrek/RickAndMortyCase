//
//  NetworkError.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation
//MARK: - Custom error handling
enum NetworkError: String, Error {
    case badURL
    case badResponse
    case unauthorized
    case unexpectedStatusCode
    case badData
    case decoding
}
