//
//  CollectionDataSource.swift
//  SSBook
//
//  Created by Victor Vieira on 18/10/22.
//

import UIKit

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
      cell.backgroundColor = .ssBookBackgroundGray
      
      
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
