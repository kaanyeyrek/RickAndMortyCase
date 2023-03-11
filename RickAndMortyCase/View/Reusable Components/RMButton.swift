//
//  RMButton.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import UIKit

class RMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(radius: CGFloat?, setBackGroundColor: UIColor?, title: String?, titleColor: UIColor?, fontName: String?, fontSize: CGFloat?) {
        self.init(frame: .zero)
        layer.cornerRadius = radius ?? 0
        backgroundColor = setBackGroundColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont(name: fontName!, size: fontSize!)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
    