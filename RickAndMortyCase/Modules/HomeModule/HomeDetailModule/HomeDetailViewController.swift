//
//  HomeDetailViewController.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/22/23.
//

import UIKit
import SDWebImage

final class HomeDetailViewController: UIViewController {
    
    var presenter: HomeDetailPresenterProtocol!
    
    private let characterLabel = RMLabel(setText: nil, setTextColor: .black, size: 25, setAlignment: .center, setFontName: "AvenirNext-Bold")
    private let characterImage = RMImage(radius: 0, setImage: nil)
    private let statusHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let statusTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let specyHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let specyTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let genderHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let genderTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let originHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let originTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let locationHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let locationTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let episodesHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let episodesTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    private let createdDateHeaderLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Bold")
    private let dateTextLabel = RMLabel(setText: nil, setTextColor: .black, size: 22, setAlignment: .left, setFontName: "AvenirNext-Regular")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setSubviews()
        setLayout()
        setHeaderLabel()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setSubviews() {
        [characterLabel, characterImage, statusHeaderLabel, statusTextLabel, specyHeaderLabel, specyTextLabel, genderHeaderLabel, genderTextLabel, originHeaderLabel, originTextLabel, locationHeaderLabel, locationTextLabel, episodesHeaderLabel, episodesTextLabel, createdDateHeaderLabel, dateTextLabel].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setLayout() {
        characterLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: 100, height: 50))
        characterLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
      
      
        characterImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 50, bottom: 0, right: 50), size: .init(width: 150, height: 325))
        characterImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160).isActive = true
        
        statusHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 80, height: 50))
        statusHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 50).isActive = true
        
        statusTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 30))
        statusTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 50).isActive = true
        statusTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        
        specyHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 80, height: 50))
        specyHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 100).isActive = true
        
        specyTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 38))
        specyTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 100).isActive = true
        specyTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        
        genderHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 100, height: 50))
        genderHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 150).isActive = true
        
        genderTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 38))
        genderTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 150).isActive = true
        genderTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        
        originHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 100, height: 50))
        originHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 200).isActive = true
        
        originTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 38))
        originTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 200).isActive = true
        originTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        
        locationHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 100, height: 50))
        locationHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 250).isActive = true
        
        locationTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 38))
        locationTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 250).isActive = true
        locationTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        
        episodesHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 110, height: 50))
        episodesHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 300).isActive = true
        
        episodesTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 38))
        episodesTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 300).isActive = true
        episodesTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        
        createdDateHeaderLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 30), size: .init(width: 120, height: 80))
        createdDateHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 360).isActive = true
        
        dateTextLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 30, bottom: 5, right: 8))
        dateTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 360).isActive = true
        dateTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
    }
    private func setHeaderLabel() {
        statusHeaderLabel.text = "Status:"
        specyHeaderLabel.text = "Specy:"
        genderHeaderLabel.text = "Gender:"
        originHeaderLabel.text = "Origin:"
        locationHeaderLabel.text = "Location:"
        episodesHeaderLabel.text = "Episodes:"
        createdDateHeaderLabel.text = "Created at\n (in API):"
    }
}
//MARK: - HomeDetailView Handling Output
extension HomeDetailViewController: HomeDetailViewProtocol {
    func updatePresenter(with presenter: CharacterPresentation) {
        characterLabel.text = presenter.name
        if let imageURL = presenter.imageUrl {
            characterImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            characterImage.sd_setImage(with: URL(string: imageURL))
        }
        statusTextLabel.text = presenter.status.capitalized
        specyTextLabel.text = presenter.species
        genderTextLabel.text = presenter.genderString.capitalized
        originTextLabel.text = presenter.origin.name.capitalized
        locationTextLabel.text = presenter.location.name
        let episodeList = presenter.episode.joined(separator: ", ")
        let words = episodeList.split(separator: " ")
        let firstEight = words.prefix(8).joined(separator: " ")
        episodesTextLabel.text = firstEight
        if let formattedCreatedDate = presenter.formattedCreatedDate {
            dateTextLabel.text = formattedCreatedDate
        } else {
            dateTextLabel.text = ""
        }
    }
    func handleOutput(with output: HomeDetailPresenterOutput) {
    }    
}
