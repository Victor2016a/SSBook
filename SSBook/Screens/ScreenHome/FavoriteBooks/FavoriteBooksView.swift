//
//  FavoriteBooksView.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class FavoriteBooksView: UIView {
  
  private let favoriteBooksLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 20)
    label.textColor = .ssBookColorGray
    label.text = "Livros favoritos"
    return label
  }()
  
  private let seeAllButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ver todos", for: .normal)
    button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
    button.setTitleColor(.ssBookPurple, for: .normal)
    return button
  }()
  
  let favoriteBooksCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 20
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.backgroundColor = .ssBookBackgroundGray
    return collection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    addSubview(favoriteBooksLabel)
    addSubview(seeAllButton)
    addSubview(favoriteBooksCollectionView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      favoriteBooksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      favoriteBooksLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      favoriteBooksLabel.bottomAnchor.constraint(equalTo: favoriteBooksCollectionView.topAnchor),
      
      seeAllButton.leadingAnchor.constraint(equalTo: favoriteBooksLabel.trailingAnchor),
      seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      seeAllButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      seeAllButton.bottomAnchor.constraint(equalTo: favoriteBooksCollectionView.topAnchor),
      seeAllButton.widthAnchor.constraint(equalToConstant: 75),
      seeAllButton.heightAnchor.constraint(equalToConstant: 16),
      
      favoriteBooksCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      favoriteBooksCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      favoriteBooksCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      favoriteBooksCollectionView.heightAnchor.constraint(equalToConstant: 306)
    ])
  }
}
