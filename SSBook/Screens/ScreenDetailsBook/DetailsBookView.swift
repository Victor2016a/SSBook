//
//  DetailsBookView.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class DetailsBookView: UIView {
  let informationBookView = InformationBookView()
  
  let detailsBookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
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
    stackView.backgroundColor = .white
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  func configure(with imageName: String) {
    
    guard let url = URL(string: imageName) else { return }
    
    ImageProvider.shared.fecthImage(url: url) { [weak self] image in
      DispatchQueue.main.async {
        self?.detailsBookImageView.image = image
      }
    }
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
    backgroundColor = .white
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(detailsBookImageView)
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(informationBookView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      detailsBookImageView.topAnchor.constraint(equalTo: topAnchor),
      detailsBookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      detailsBookImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      detailsBookImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
    let heightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
    heightAnchor.priority = .defaultLow
    heightAnchor.isActive = true
  }
}
