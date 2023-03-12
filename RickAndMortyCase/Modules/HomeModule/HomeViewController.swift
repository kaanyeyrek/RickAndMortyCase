//
//  ViewController.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/9/23.
//

import UIKit

final class HomeViewController: UIViewController {
//MARK: - Global
    // Dependency
    var presenter: HomePresenterProtocol!
    
    // UI Elements
    private var collection: UICollectionView!
    private let logoImage = RMImage(radius: nil, setImage: UIImage(named: CustomImage.logo))
//MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCollectionDefaultLayout()
        setSubviews()
        setLayout()
        setRegisterCollection()
        setOwner()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setRegisterCollection() {
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    private func setLayout() {
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height-250))
        
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50), size: .init(width: 50, height: 100))
        logoImage.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
    }
    private func setSubviews() {
        [collection, logoImage].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setOwner() {
        collection.delegate = self
        collection.dataSource = self
    }
    private func setCollectionDefaultLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
    }
}
//MARK: - UICollectionViewDataSource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.layer.borderWidth = 1.5
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}
//MARK: - UICollectionViewDelegate Methods
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout Methods
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width)
        return .init(width: width - 40, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 30, bottom: 0, right: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .init(20)
    }
}
//MARK: - HomeViewProtocol / Handling PresenterOutput
extension HomeViewController: HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput) {
        
    }
}

