//
//  WelcomeViewController.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let logoImage = RMImage(radius: nil, setImage: UIImage(named: CustomImage.logo))
    private let welcomeLabel = RMLabel(setText: "Welcome!", setTextColor: .black, size: 30, setAlignment: .center, setFontName: "Copperplate")
    private let doneButton = RMButton(radius: 20, setBackGroundColor: .darkGray, title: "Let's Go!", titleColor: .white, fontName: "San Francisco", fontSize: 25)
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let check = CheckFirstLoginMethod().isNewUser()
        if check {
            welcomeLabel.text = "Hello!"
        } else {
            welcomeLabel.text = "Welcome!"
            CheckFirstLoginMethod().notNewUser()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setLayout()
        setUI()
        setupAnimations()
        setTargets()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setSubviews() {
        [logoImage, welcomeLabel, doneButton].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setTargets() {
        doneButton.addTarget(self, action: #selector(didTappedDoneButton), for: .touchUpInside)
    }
    @objc private func didTappedDoneButton() {
        let homeVC = HomeBuilder.make()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    private func setLayout() {
        logoImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 80, height: 120))
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        welcomeLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        
        doneButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 160, bottom: 0, right: 160), size: .init(width: 50, height: 50))
        doneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
    }
    private func setupAnimations() {
        logoImage.transform = CGAffineTransform(translationX: -500, y: 0)
        welcomeLabel.transform = CGAffineTransform(translationX: 500, y: 0)
        doneButton.transform = CGAffineTransform(translationX: -500, y: 0)
        UIView.animate(withDuration: 1.3, delay: 0.6 * 1.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseOut) {
                    self.logoImage.transform = .identity
                    self.welcomeLabel.transform = .identity
                    self.doneButton.transform = .identity
        }
    }
}
