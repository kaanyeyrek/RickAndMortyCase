//
//  RMView.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/27/23.
//

import UIKit
// reusable empty view
class RMView: UIView {
    
    let headerLabel = RMLabel(setText: nil, setTextColor: .lightGray, size: 20, setAlignment: .center, setFontName: "AvenirNext-Bold")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(message: String) {
        self.init(frame: .zero)
        headerLabel.text = message
    }
    private func configure() {
        addSubview(headerLabel)
        headerLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: self.frame.width, height: 40))
        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

