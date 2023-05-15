//
//  CollectionDelegateFlowLayout.swift
//  SSBook
//
//  Created by Victor Vieira on 18/10/22.
//

import UIKit

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
