//
//  AllBooksView.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class AllBooksView: UIView {
  
  private let allBooksLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Roboto-Bold", size: 20)
    label.textColor = .ssBookColorGray
    label.text = "Biblioteca"
    return label
  }()
  
  private let allBooksStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor = .white
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let categoryStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor = .white
    stackView.axis = .horizontal
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
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
    addSubview(allBooksLabel)
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(categoryStackView)
    addSubview(allBooksStackView)
  }
  
  func configureRowAllBooks(viewModel: AllBooksViewModelCell) {
    let stackViewCell = AllBooksViewCell()
    stackViewCell.configure(viewModel: viewModel)
    allBooksStackView.addArrangedSubview(stackViewCell)
  }
  
  func configureRowCategory(stackViewCell: SegmentedControlCategoryViewCell) {
    
    categoryStackView.addArrangedSubview(stackViewCell)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      allBooksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      allBooksLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      allBooksLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      scrollView.topAnchor.constraint(equalTo: allBooksLabel.bottomAnchor, constant: 20),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: allBooksStackView.topAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
      
      categoryStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      categoryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      categoryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      categoryStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      allBooksStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      allBooksStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      allBooksStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    let widthAnchor = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    widthAnchor.priority = .defaultLow
    widthAnchor.isActive = true
  }
}
