//
//  Constants.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import Foundation

public enum CustomImage {
    static let logo = "logo"
}
public enum Color {
    static let purple = "#9f86c0ff"
    static let selectedCategoryColor = "#6ac3ffff"
}
public enum ReuseIdemtifier {
    static let characters = "CharactersCollectionViewCell"
}
public enum GenderType {
    case female
    case male
    case unknown
    
    init(rawValue: String) {
        switch rawValue {
        case "female":
            self = .female
        case "male":
            self = .male
        default:
            self = .unknown
        }
    }
}
