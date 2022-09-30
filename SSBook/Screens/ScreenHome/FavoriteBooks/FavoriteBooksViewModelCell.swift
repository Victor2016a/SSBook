//
//  FavoriteBooksViewModelCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation

class FavoriteBooksViewModelCell {
  var favoriteBookImageName: String
  var favoriteBookTitle: String
  var favoriteBookAuthorName: String
  var favoriteBookID: String
  
  
  init(favoriteBookImageName: String,
       favoriteBookTitle: String,
       favoriteBookAuthorName: String,
       favoriteBookID: String) {
    
    self.favoriteBookImageName = favoriteBookImageName
    self.favoriteBookTitle = favoriteBookTitle
    self.favoriteBookAuthorName = favoriteBookAuthorName
    self.favoriteBookID = favoriteBookID
  }
}
