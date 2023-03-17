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
    private var service: RMServiceInterface
    private var currentPage: Int = 1
    private var locationResultModel: [Locations] = []
    private var multipleCharactersModel: [Character] = []
    
    init(service: RMServiceInterface = RMService(coreService: CoreService())) {
        self.service = service
    }
    func load() {
        fetchCategoryLocations()
    }
    func fetchCategoryLocations() {
        service.fetchLocation(endPoint: .getLocations(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let location):
                    self.locationResultModel = location.results
                    self.delegate?.handleOutput(.showCategoryLocations(location.results))
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
    func showSelectedLocationCharacters(with ids: [String]) {
        service.fetchMultipleCharacters(endPoint: .getMultipleCharacters(ids: ids)) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.multipleCharactersModel = characters
                    self.delegate?.handleOutput(.showSelectedLocations(characters))
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
}
