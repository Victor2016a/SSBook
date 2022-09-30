//
//  HomeViewController.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
  private let homeView = HomeView()
  private let viewModel: HomeViewModel
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    homeView.favoriteAuthorsView.roundCorners(corners: [.topLeft], radius: 32)
    homeView.customSegmented.stack.roundCorners(corners: [.bottomRight], radius: 32)
  }
  
  override func loadView() {
    super.loadView()
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigation()
    loadScreenData()
    setupView()
  }
  
  private func setupNavigation() {
    let label = UILabel()
    
    let text = NSMutableAttributedString()
    text.append(NSAttributedString(string: "SS",
                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)]));
    text.append(NSAttributedString(string: "BOOK",
                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)]))
    
    label.font = UIFont(name: "BebasNeue-Regular", size: 40)
    label.attributedText = text
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
  }
  
  private func setupView() {
    setupFavoriteBooksCollection()
    setupFavoriteAuthorsCollection()
    setupCategoriesBook(index: 0)
  }
  
  private func setupFavoriteBooksCollection() {
    let favoriteBooksCollection = homeView.favoriteBooksView.favoriteBooksCollectionView
    favoriteBooksCollection.register(FavoriteBooksCollectionViewCell.self,
                                     forCellWithReuseIdentifier:
                                      FavoriteBooksCollectionViewCell.identifier)
    
    favoriteBooksCollection.dataSource = self
    favoriteBooksCollection.delegate = self
  }
  
  private func setupFavoriteAuthorsCollection() {
    let favoriteAuthorsCollection = homeView.favoriteAuthorsView.favoriteAuthorsCollectionView
    favoriteAuthorsCollection.register(FavoriteAuthorsCollectionViewCell.self,
                                     forCellWithReuseIdentifier:
                                      FavoriteAuthorsCollectionViewCell.identifier)
    
    favoriteAuthorsCollection.dataSource = self
    favoriteAuthorsCollection.delegate = self
  }
  
  private func setupCategoriesBook(index: Int? = nil) {
    let categoriesArray = ["Todos","Romance","Aventura","Comédia","Terror", "Tecnologia", "Viagem"]
    viewModel.categoriesBook = categoriesArray
    
    categoriesArray.enumerated().forEach { [weak self] in
      let stackViewCell = SegmentedControlCategoryViewCell()
      stackViewCell.configure(title: $1, index: $0)
      stackViewCell.didSelected = { [weak self] in
        self?.markButton(index: $0)
      }
      if let index = index {
        stackViewCell.isSelected = index == $0
      }
      self?.homeView.allBooksView.configureRowCategory(stackViewCell: stackViewCell)
    }
  }
  
  private func markButton(index: Int) {
    homeView.allBooksView.categoryStackView.arrangedSubviews.forEach { $0.removeFromSuperview()}
    
    setupCategoriesBook(index: index)
    
  }
  
  
  private func loadScreenData() {
    ApolloNetwork.shared.apollo.fetch(query: UserPictureQuery()) { [weak self] result in
      
      switch result {
      case.success(let userData):
        guard let url = URL(string: userData.data?.userPicture ?? "") else { return }
        ImageProvider.shared.fecthImage(url: url) { [weak self] image in
          
          let userProfileButton = UIButton(type: .custom)
            userProfileButton.imageView?.contentMode = .scaleAspectFill
            userProfileButton.clipsToBounds = true
          userProfileButton.addTarget(self, action: #selector(self?.profilePictureTapped), for: .touchUpInside)
            userProfileButton.setImage(image, for: .normal)
            userProfileButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)


          userProfileButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
          userProfileButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
          userProfileButton.layer.masksToBounds = true
          let width = userProfileButton.bounds.width
          userProfileButton.layer.cornerRadius = width/2
          let barButtonItem = UIBarButtonItem(customView: userProfileButton)
          
          DispatchQueue.main.async {
             self?.navigationItem.rightBarButtonItem = barButtonItem
          }
        }
        
      case.failure(let error):
        print(error.localizedDescription)
      }
      
    }
    
    viewModel.fetchFavoriteBooksData { [weak self] result in
      self?.homeView.favoriteBooksView.favoriteBooksCollectionView.reloadData()
    }
    
    viewModel.fetchFavoriteAuthorsData { [weak self] result in
      self?.homeView.favoriteAuthorsView.favoriteAuthorsCollectionView.reloadData()
    }
    
    viewModel.fetchAllBooksData { [weak self] result in
      guard let countBooks = self?.viewModel.allBooksNumberOfRows() else { return }
      
      for row in 0 ... (countBooks-1) {
        guard let viewModel = self?.viewModel.cellForRowAllBooks(at: row) else { return }
        self?.homeView.allBooksView.configureRowAllBooks(viewModel: viewModel)
      }
    }
  }
  
  @objc private func profilePictureTapped() {
    
  }
}

extension HomeViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    let favoriteBooksCollection = homeView.favoriteBooksView.favoriteBooksCollectionView
    
    if collectionView == favoriteBooksCollection {
      return viewModel.favoriteBooksNumberOfRows(section: section)
    }
    return viewModel.favoriteAuthorsNumberOfRows(section: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let favoriteBooksCollection = homeView.favoriteBooksView.favoriteBooksCollectionView
    
    if collectionView == favoriteBooksCollection {
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteBooksCollectionViewCell.identifier, for: indexPath) as? FavoriteBooksCollectionViewCell else { return .init() }
      
      let viewModel = viewModel.cellForRowFavoriteBooks(at: indexPath)
      cell.configure(viewModel: viewModel)
      cell.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
      
      return cell
      
    } else {
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteAuthorsCollectionViewCell.identifier, for: indexPath) as? FavoriteAuthorsCollectionViewCell else { return .init() }
      
      let viewModel = viewModel.cellForRowFavoriteAuthors(at: indexPath)
      cell.configure(viewModel: viewModel)
      cell.backgroundColor = .white
      cell.layer.masksToBounds = true
      cell.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
      cell.layer.borderWidth = 1
      cell.layer.cornerRadius = 8
      return cell
    }
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let favoriteBooksCollection = homeView.favoriteBooksView.favoriteBooksCollectionView
    
    if collectionView == favoriteBooksCollection {
      return CGSize(width: 136, height: 282)
    } else {
      return CGSize(width: 248, height: 69)
    }
  }
}

extension HomeViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let favoriteBooksCollection = homeView.favoriteBooksView.favoriteBooksCollectionView
    
    if collectionView == favoriteBooksCollection {
      let detailsBookViewModel = DetailsBookViewModel(detailsBookModel: FavoriteBookQuery.Data.Book.init(cover: "", name: "", author: FavoriteBookQuery.Data.Book.Author.init(name: ""), description: ""))
      
      let idBook = viewModel.idCellFavoriteBook(at: indexPath)
      
      navigationController?.pushViewController(DetailsBookViewController(viewModel: detailsBookViewModel, idBook: idBook), animated: true)
    }
  }
}
