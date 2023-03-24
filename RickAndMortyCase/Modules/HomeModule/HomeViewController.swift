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
    private let categoryStackView = UIStackView()
    private let scrollView = UIScrollView()
    private var selectedButton: [UIButton] = []
    private var locationPresentation: [HomePresentation] = []
    private var multipleCharactersPresentation: [CharacterPresentation] = []
//MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setCollectionDefaultLayout()
        setSubviews()
        setStackView()
        setLayout()
        setRegisterCollection()
        setOwner()
        setScrollView()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setRegisterCollection() {
        collection.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdemtifier.characters)
    }
    private func setLayout() {
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height-250))
        
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50), size: .init(width: 50, height: 100))
        logoImage.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        logoImage.contentMode = .scaleAspectFit
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: view.frame.width, height: 50))
        scrollView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        categoryStackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: scrollView.frame.width, height: 50))
        categoryStackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
    }
    private func setSubviews() {
        [collection, logoImage, scrollView].forEach { elements in
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
    private func setScrollView() {
        scrollView.contentSize = CGSize(width: categoryStackView.frame.width, height: categoryStackView.frame.height)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    private func setStackView() {
        scrollView.addSubview(categoryStackView)
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillProportionally
        categoryStackView.spacing = 13
    }
    private func createCategoriesButton() {
        if !locationPresentation.isEmpty {
            for index in 0..<locationPresentation.count {
                let config = UIButton.Configuration.filled()
                let categoryButton = RMButton(radius: 10, setBackGroundColor: nil, title: locationPresentation[index].name, titleColor: .white, fontName: "San Francisco", fontSize: 25, textAlign: .center, configuration: config)
                categoryButton.layer.borderWidth = 1.5
                categoryButton.layer.borderColor = UIColor.black.cgColor
                categoryButton.titleLabel?.adjustsFontSizeToFitWidth = true
                categoryButton.titleLabel?.minimumScaleFactor = 0.5
                categoryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
                categoryButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
                categoryButton.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                categoryButton.addTarget(self, action: #selector(didTappedCategoryButton), for: .touchUpInside)
                categoryStackView.addArrangedSubview(categoryButton)
            }
        }
    }
//MARK: - @objc actions
    @objc private func didTappedCategoryButton(index: UIButton) {
        for previousSelectedButton in selectedButton {
            previousSelectedButton.configuration?.baseBackgroundColor = UIColor(hex: Color.purple)
        }
        index.configuration?.baseBackgroundColor = UIColor(hex: Color.selectedCategoryColor)
        selectedButton = [index]
        guard let category = index.currentTitle else {
              return
          }
          if let categoryPresentation = locationPresentation.first(where: {$0.name == category}) {
              let ids = categoryPresentation.residents.compactMap { URL(string: $0)?.lastPathComponent}
              presenter.didTappedCategoryButton(with: ids)
          }
    }
}
//MARK: - UICollectionViewDataSource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        multipleCharactersPresentation.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdemtifier.characters, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell()}
        cell.contentView.layer.borderWidth = 1.5
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        let model = multipleCharactersPresentation[indexPath.item]
        cell.setCharactersImage(model: model)
        cell.setCharactersLabel(model: model)
        cell.setGenderImage(model: model)
        return cell
    }
}
//MARK: - UICollectionViewDelegate Methods
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter.selectedCharacter(at: indexPath.item)
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
        switch output {
        case .showLocations(let locationPresentation):
            self.locationPresentation = locationPresentation
            createCategoriesButton()
        case .showMultipleCharacters(let characters):
            self.multipleCharactersPresentation = characters
            self.collection.reloadData()
        }
    }
}

