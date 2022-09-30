//
//  SegmentedControlCategory.swift
//  SSBook
//
//  Created by Victor Vieira on 29/09/22.
//

import UIKit

class SegmentedControlCategoryViewCell: UIView {
  var index: Int?
  var didSelected: ((Int) -> Void)?
  var isSelected: Bool = false {
    didSet {
      if isSelected {
        changeColors()
      }
    }
  }
  
  let categoryBookButton: UIButton = {
    let button = UIButton()
    button.tintColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
    button.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private func changeColors() {
    categoryBookButton.setTitleColor(.white, for: .normal)
    categoryBookButton.backgroundColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)
    backgroundColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)
    layer.borderColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1).cgColor
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    layer.masksToBounds = true
    layer.cornerRadius = 16
    layer.borderWidth = 1.0
    layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1).cgColor
    setupCellView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(title: String, index: Int) {
    categoryBookButton.addTarget(self, action: #selector(pressCategory), for: .touchUpInside)
    self.index = index
    categoryBookButton.setTitle(title, for: .normal)
  }
  
  @objc private func pressCategory() {
    guard let index = index else { return }
    didSelected?(index)
  }
  
  private func setupCellView() {
   addSubview(categoryBookButton)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      categoryBookButton.topAnchor.constraint(equalTo: topAnchor),
      categoryBookButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      categoryBookButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      categoryBookButton.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
