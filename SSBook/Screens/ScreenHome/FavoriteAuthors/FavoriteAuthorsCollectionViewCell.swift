//
//  FavoriteAuthorsCollectionViewCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class FavoriteAuthorsCollectionViewCell: UICollectionViewCell {
  static let identifier = "FavoriteAuthorsCollectionViewCell"
  
  let authorImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let authorNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 16)
    label.textColor = .ssBookColorGray
    return label
  }()
  
  let authorBooksCountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Regular", size: 14)
    label.textColor = .ssBookColorLightGray
    return label
  }()
  
  func configure(viewModel: FavoriteAuthorsViewModelCell) {
    guard let url = URL(string: viewModel.authorImageName) else { return }
    ImageProvider.shared.fecthImage(url: url) { [weak self] image in
      DispatchQueue.main.async {
        self?.authorImageView.image = image
        self?.authorImageView.layer.masksToBounds = true
        self?.authorImageView.layer.cornerRadius = 8
      }
    }
    authorNameLabel.text = viewModel.authorName
    if viewModel.authorBooksCount > 1 {
      authorBooksCountLabel.text = "\(viewModel.authorBooksCount) livros"
    } else {
      authorBooksCountLabel.text = "\(viewModel.authorBooksCount) livro"
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupCellView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCellView() {
    contentView.addSubview(authorImageView)
    contentView.addSubview(authorNameLabel)
    contentView.addSubview(authorBooksCountLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      authorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      authorImageView.heightAnchor.constraint(equalToConstant: 67),
      authorImageView.widthAnchor.constraint(equalToConstant: 63),
      authorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      authorNameLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 20),
      authorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      authorNameLabel.bottomAnchor.constraint(equalTo: authorBooksCountLabel.topAnchor),
      
      authorBooksCountLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor),
      authorBooksCountLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 20),
      authorBooksCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      authorBooksCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
    ])
  }
}
