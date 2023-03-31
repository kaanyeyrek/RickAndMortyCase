//
//  RMLabel.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import UIKit
// reusable label
class RMLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(setText: String?, setTextColor: UIColor?, size: CGFloat?, setAlignment: NSTextAlignment?, setFontName: String?) {
        self.init(frame: .zero)
        text = setText
        textColor = setTextColor
        textAlignment = setAlignment!
        font = UIFont(name: setFontName!, size: size!)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
