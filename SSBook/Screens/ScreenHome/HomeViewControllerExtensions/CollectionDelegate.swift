//
//  CollectionDelegate.swift
//  SSBook
//
//  Created by Victor Vieira on 18/10/22.
//

import UIKit

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
