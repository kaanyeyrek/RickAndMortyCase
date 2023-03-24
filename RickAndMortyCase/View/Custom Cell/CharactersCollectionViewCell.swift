//
//  CharactersCollectionViewCell.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/19/23.
//

import UIKit
import SDWebImage

class CharactersCollectionViewCell: UICollectionViewCell {
    
    private let charactersImage = RMImage(radius: nil, setImage: nil)
    private let charactersLabel = RMLabel(setText: nil, setTextColor: .black, size: 20, setAlignment: .center, setFontName: "Copperplate")
    private let charactersGenderImage = RMImage(radius: nil, setImage: nil)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setSubviews() {
        [charactersImage, charactersLabel, charactersGenderImage].forEach { elements in
            self.addSubview(elements)
        }
    }
    private func setLayout() {
        charactersImage.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 120, height: self.frame.height))
        
        charactersLabel.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 10), size: .init(width: 80, height: 70))
        charactersLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 115).isActive = true
        
        charactersGenderImage.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .init(width: 150, height: 50))
        charactersGenderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 25).isActive = true
        self.sendSubviewToBack(charactersGenderImage)
    }
    func setCharactersImage(model: CharacterPresentation) {
        if let imageURL = model.imageUrl {
            charactersImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            charactersImage.sd_imageTransition = .fade
            charactersImage.sd_setImage(with: URL(string: imageURL))
        }
    }
    func setCharactersLabel(model: CharacterPresentation) {
        charactersLabel.text = model.name
    }
    func setGenderImage(model: CharacterPresentation) {
        switch model.gender {
        case .female:
            charactersGenderImage.image = UIImage(named: "female")
        case .male:
            charactersGenderImage.image = UIImage(named: "male")
        case .unknown:
            charactersGenderImage.image = UIImage(named: "unknown")
        }
      }
}
