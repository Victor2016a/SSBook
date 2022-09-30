//
//  DetailsBookViewController.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit

class DetailsBookViewController: UIViewController {
  
  let detailsBookView = DetailsBookView()
  let viewModel: DetailsBookViewModel
  let idBook: String
  var isMakeLinearGradient: Bool = false
  
  init(viewModel: DetailsBookViewModel,
       idBook: String) {
    
    self.idBook = idBook
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    detailsBookView.stackView.roundCorners(corners: [.topLeft], radius: 32)
    if !isMakeLinearGradient {
      setupLinearGradient()
    }
  }
  
  override func loadView() {
    super.loadView()
    view = detailsBookView
  }
  
  private func setupLinearGradient() {
    let gradient = CAGradientLayer()
    gradient.frame = CGRect(x: 0, y: 0, width: detailsBookView.detailsBookImageView.frame.width, height: 153)
    let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
    let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    gradient.colors = [startColor, endColor]
    gradient.opacity = 0.7
    detailsBookView.detailsBookImageView.layer.insertSublayer(gradient, at: 0)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigation()
    loadBookDetails()
    pressFavoriteBook()
  }
  
  private func setupNavigation() {
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(back))
    
    navigationController?.navigationBar.tintColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ellipsis-vertical"), style: .plain, target: self, action: #selector(moreDetails))
  }
  
  @objc private func back() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func moreDetails() {
    
  }
  
  private func pressFavoriteBook() {
    detailsBookView.informationBookView.bookFavoriteMarkButton.addTarget(self, action: #selector(changeFavoriteImage), for: .touchUpInside)
  }
  
  @objc private func changeFavoriteImage() {
    isMakeLinearGradient = true
    
    let buttonTitleText = detailsBookView.informationBookView.bookFavoriteMarkButton.titleLabel!.text
    
    if buttonTitleText == "heart" {
      
      detailsBookView.informationBookView.bookFavoriteMarkButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      detailsBookView.informationBookView.bookFavoriteMarkButton.titleLabel?.text = "heart.fill"
      detailsBookView.informationBookView.bookFavoriteMarkButton.tintColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)
      
    } else {
      
      detailsBookView.informationBookView.bookFavoriteMarkButton.setImage(UIImage(systemName: "heart"), for: .normal)
      detailsBookView.informationBookView.bookFavoriteMarkButton.titleLabel?.text = "heart"
      detailsBookView.informationBookView.bookFavoriteMarkButton.tintColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    }
  }
  
  private func loadBookDetails() {
    viewModel.fetchDetailsBookData(with: idBook) { [weak self] result in
      guard let viewModel = self?.viewModel.stackForInformationBook() else { return }
      
      self?.detailsBookView.configure(with: viewModel.imageBookName)
      self?.detailsBookView.informationBookView.configure(viewModel: viewModel)
    }
  }
}
