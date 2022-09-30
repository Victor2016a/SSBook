//
//  InformationOfBookView.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class InformationBookView: UIView {
  
  let bookTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 20)
    label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    label.numberOfLines = 2
    return label
  }()
  
  let bookAuthorNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Regular", size: 14)
    label.textColor = UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)
    return label
  }()
  
  let bookDescriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Regular", size: 16)
    label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    label.numberOfLines = 0
    return label
  }()
  
  let bookFavoriteMarkButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "heart"), for: .normal)
    button.tintColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    button.frame.size = CGSize(width: 20, height: 18.35)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  func configure(viewModel: InformationBookViewModel) {
    bookTitleLabel.text = viewModel.bookTitle
    bookAuthorNameLabel.text = viewModel.authorName
    bookDescriptionLabel.text = viewModel.bookDescription
  }

  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    addSubview(bookFavoriteMarkButton)
    addSubview(bookTitleLabel)
    addSubview(bookAuthorNameLabel)
    addSubview(bookDescriptionLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      bookTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
      bookTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      bookTitleLabel.trailingAnchor.constraint(equalTo: bookFavoriteMarkButton.leadingAnchor, constant: -20),
      
      bookFavoriteMarkButton.topAnchor.constraint(equalTo: topAnchor, constant: 35),
      bookFavoriteMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      bookFavoriteMarkButton.bottomAnchor.constraint(equalTo: bookDescriptionLabel.topAnchor, constant: -68.65),
      
      bookAuthorNameLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 8),
      bookAuthorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      bookAuthorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      
      bookDescriptionLabel.topAnchor.constraint(equalTo: bookAuthorNameLabel.bottomAnchor, constant: 20),
      bookDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      bookDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      bookDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
    ])
  }
}
