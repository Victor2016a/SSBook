//
//  FavoriteBooksCollectionViewCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class FavoriteBooksCollectionViewCell: UICollectionViewCell {
  static let identifier = "FavoriteBooksCollectionViewCell"
  
  let favoriteBookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let favoriteBookTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 16)
    label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    label.numberOfLines = 2
    return label
  }()
  
  let favoriteBookAuthorNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Regular", size: 14)
    label.textColor = UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)
    label.numberOfLines = 2
    return label
  }()
  
  func configure(viewModel: FavoriteBooksViewModelCell) {
    guard let url = URL(string: viewModel.favoriteBookImageName) else { return }
    ImageProvider.shared.fecthImage(url: url) { [weak self] image in
      DispatchQueue.main.async {
        self?.favoriteBookImageView.image = image
        self?.favoriteBookImageView.layer.masksToBounds = true
        self?.favoriteBookImageView.layer.cornerRadius = 8
      }
    }
    favoriteBookTitleLabel.text = viewModel.favoriteBookTitle
    favoriteBookAuthorNameLabel.text = viewModel.favoriteBookAuthorName
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    contentView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    setupCellView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCellView() {
    contentView.addSubview(favoriteBookImageView)
    contentView.addSubview(favoriteBookTitleLabel)
    contentView.addSubview(favoriteBookAuthorNameLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      favoriteBookImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      favoriteBookImageView.widthAnchor.constraint(equalToConstant: 136),
      favoriteBookImageView.heightAnchor.constraint(equalToConstant: 198),
      favoriteBookImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      favoriteBookTitleLabel.topAnchor.constraint(equalTo: favoriteBookImageView.bottomAnchor, constant: 10),
      favoriteBookTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      favoriteBookTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      favoriteBookAuthorNameLabel.topAnchor.constraint(equalTo: favoriteBookTitleLabel.bottomAnchor, constant: 2),
      favoriteBookAuthorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      favoriteBookAuthorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      favoriteBookAuthorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
