//
//  FavoriteAuthors.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class FavoriteAuthorsView: UIView {
  private let favoriteAuthorsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 20)
    label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    label.text = "Autores favoritos"
    return label
  }()
  
  private let seeAllButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ver todos", for: .normal)
    button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
    button.setTitleColor(UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1), for: .normal)
    return button
  }()
  
  let favoriteAuthorsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.backgroundColor = .white
    return collection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    backgroundColor = .white
    
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    addSubview(favoriteAuthorsLabel)
    addSubview(seeAllButton)
    addSubview(favoriteAuthorsCollectionView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      favoriteAuthorsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      favoriteAuthorsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      favoriteAuthorsLabel.bottomAnchor.constraint(equalTo: favoriteAuthorsCollectionView.topAnchor, constant: -20),
      
      seeAllButton.leadingAnchor.constraint(equalTo: favoriteAuthorsLabel.trailingAnchor),
      seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      seeAllButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      seeAllButton.bottomAnchor.constraint(equalTo: favoriteAuthorsCollectionView.topAnchor, constant: -20),
      seeAllButton.widthAnchor.constraint(equalToConstant: 75),
      seeAllButton.heightAnchor.constraint(equalToConstant: 16),
      
      favoriteAuthorsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      favoriteAuthorsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      favoriteAuthorsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      favoriteAuthorsCollectionView.heightAnchor.constraint(equalToConstant: 68)
    ])
  }
}

extension UIView {
  
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let cornerRadii: CGSize = CGSize(width: radius, height: radius)
    let path: UIBezierPath = UIBezierPath(roundedRect: bounds,
                                          byRoundingCorners: corners,
                                          cornerRadii: cornerRadii)
    let mask: CAShapeLayer = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
  
}
