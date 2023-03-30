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
    private let scroll = UIScrollView()
    private let containerView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setSubviews()
        setScrollLandscapeMode()
        setLayout()
        setHeaderLabel()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setSubviews() {
        view.addSubview(scroll)
        scroll.addSubview(containerView)
        [characterLabel, characterImage, statusHeaderLabel, statusTextLabel, specyHeaderLabel, specyTextLabel, genderHeaderLabel, genderTextLabel, originHeaderLabel, originTextLabel, locationTextLabel, locationHeaderLabel, episodesHeaderLabel, episodesTextLabel, dateTextLabel, createdDateHeaderLabel].forEach { elements in
            containerView.addSubview(elements)
        }
    }
    private func setScrollLandscapeMode() {
        scroll.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scroll.contentOffset = CGPoint(x: 0, y: 0)
        scroll.showsVerticalScrollIndicator = false
    }
    private func setLayout() {
        scroll.fillSuperView()
        
        containerView.anchor(top: scroll.topAnchor, leading: scroll.leadingAnchor, bottom: scroll.bottomAnchor, trailing: scroll.trailingAnchor)
        containerView.centerYAnchor.constraint(equalTo: scroll.centerYAnchor, constant: 55).isActive = true
        containerView.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: scroll.heightAnchor, constant: 300).isActive = true
         
        characterLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 50))
        characterLabel.centerYAnchor.constraint(equalTo: containerView.topAnchor, constant: 75).isActive = true
            
        characterImage.anchor(top: containerView.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 80, bottom: 0, right: 80), size: .init(width: 150, height: 280))
        characterImage.centerYAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 150).isActive = true
        characterImage.contentMode = .scaleAspectFit
            
        statusHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 80, height: 50))
        statusHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 40).isActive = true
            
        statusTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 20))
        statusTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 40).isActive = true
        statusTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 70).isActive = true
        
        specyHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 80, height: 50))
        specyHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 85).isActive = true

        specyTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 28))
        specyTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 85).isActive = true
        specyTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 65).isActive = true

        genderHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 100, height: 50))
        genderHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 130).isActive = true

        genderTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 28))
        genderTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 130).isActive = true
        genderTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 65).isActive = true

        originHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 100, height: 50))
        originHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 175).isActive = true

        originTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 28))
        originTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 175).isActive = true
        originTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 65).isActive = true

        locationHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 100, height: 50))
        locationHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 220).isActive = true

        locationTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 28))
        locationTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 220).isActive = true
        locationTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 65).isActive = true

        episodesHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 110, height: 50))
        episodesHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 265).isActive = true

        episodesTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 28))
        episodesTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 265).isActive = true
        episodesTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 65).isActive = true

        createdDateHeaderLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 30, bottom: 5, right: 0), size: .init(width: 120, height: 80))
        createdDateHeaderLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 320).isActive = true

        dateTextLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 0))
        dateTextLabel.centerYAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 320).isActive = true
        dateTextLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 80).isActive = true
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
