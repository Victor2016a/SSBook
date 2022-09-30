//
//  AllBooksViewCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class AllBooksViewCell: UIView {
  
  let bookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let bookTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 16)
    label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    label.numberOfLines = 0
    return label
  }()
  
  let bookAuthorNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Regular", size: 14)
    label.textColor = UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)
    return label
  }()
  
  func configure(viewModel: AllBooksViewModelCell) {
    guard let url = URL(string: viewModel.bookImageName) else { return }
    
    ImageProvider.shared.fecthImage(url: url) { [weak self] image in
      DispatchQueue.main.async {
        self?.bookImageView.image = image
        self?.bookImageView.layer.masksToBounds = true
        self?.bookImageView.layer.cornerRadius = 8
      }
    }
    
    bookTitleLabel.text = viewModel.bookTitle
    bookAuthorNameLabel.text = viewModel.bookAuthorName
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
    addSubview(bookImageView)
    addSubview(bookTitleLabel)
    addSubview(bookAuthorNameLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      bookImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      bookImageView.heightAnchor.constraint(equalToConstant: 70),
      bookImageView.widthAnchor.constraint(equalToConstant: 48),
      
      bookTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
      bookTitleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10),
      bookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      bookTitleLabel.bottomAnchor.constraint(equalTo: bookAuthorNameLabel.topAnchor, constant: -5),
      
      bookAuthorNameLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10),
      bookAuthorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      bookAuthorNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
