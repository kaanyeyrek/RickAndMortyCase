//
//  CharactersPresentation.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/18/23.
//

import Foundation

final class CharacterPresentation {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: GenderType
    let genderString: String
    let origin: LocationPresentation
    let location: LocationPresentation
    let imageUrl: String?
    let episode: [String]
    let createdDate: String
    var formattedCreatedDate: String? {
            return createdDate.toDate(with: "dd MMMM yyyy, HH:mm:ss")
        }
    
    init(model: Character) {
        self.id = model.id
        self.name = model.name
        self.status = model.status
        self.species = model.species
        self.gender = GenderType(rawValue: model.gender.lowercased())
        self.origin = LocationPresentation(model: model.origin)
        self.location = LocationPresentation(model: model.location)
        self.imageUrl = model.image
        self.episode = model.episode.map { URL(string: $0)?.lastPathComponent ?? ""}
        self.createdDate = model.created
        self.genderString = model.gender
    }
}
final class LocationPresentation {
    let name: String
    let url: String
    
    init(model: Location) {
        self.name = model.name
        self.url = model.url
    }
}

