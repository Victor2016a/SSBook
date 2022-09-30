//
//  HomeView.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class HomeView: UIView {
  let favoriteBooksView = FavoriteBooksView()
  let favoriteAuthorsView = FavoriteAuthorsView()
  let allBooksView = AllBooksView()
  
  let customSegmented: CustomSegmentedControl = {
    let customSegmented = CustomSegmentedControl(frame: .zero, buttonTitle: ["Meus livros", "Emprestados"])
    customSegmented.translatesAutoresizingMaskIntoConstraints = false
    return customSegmented
  }()
  
  private let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor =  UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
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
    backgroundColor = .white
    addSubview(customSegmented)
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(stackView)
    setupStackView()
  }
  
  private func setupStackView() {
    stackView.addArrangedSubview(favoriteBooksView)
    stackView.addArrangedSubview(favoriteAuthorsView)
    stackView.addArrangedSubview(allBooksView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      customSegmented.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      customSegmented.leadingAnchor.constraint(equalTo: leadingAnchor),
      customSegmented.trailingAnchor.constraint(equalTo: trailingAnchor),
      customSegmented.heightAnchor.constraint(equalToConstant: 48),
      
      scrollView.topAnchor.constraint(equalTo: customSegmented.bottomAnchor, constant: 5),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
    let heightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
    heightAnchor.priority = .defaultLow
    heightAnchor.isActive = true
  }
}
