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
//MARK: - LifeCycle
    func load() {
        fetchCategoryLocations()
    }
    // fetch location 
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
    // select location category
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
    // select detail
    func selectedCharacter(at index: Int) {
        let model = multipleCharactersModel[index]
        self.delegate?.handleOutput(.showSelectedCharacter(model))
    }
    // next page for location 
    func getNextLocation() {
        self.delegate?.handleOutput(.setLoading(true))
        currentPage += 1
        service.fetchLocation(endPoint: .getLocations(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.delegate?.handleOutput(.setLoading(false))
                switch result {
                case .success(let locations):
                    self.locationResultModel = locations.results
                    self.delegate?.handleOutput(.showNextCategoryLocations(locations.results))
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
}
