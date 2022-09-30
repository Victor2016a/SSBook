//
//  FavoriteAuthorsViewModelCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation

class FavoriteAuthorsViewModelCell {
  
  var authorImageName: String
  var authorName: String
  var authorBooksCount: Int
  
  
  init(authorImageName: String,
       authorName: String,
       authorBooksCount: Int) {
    
    self.authorImageName = authorImageName
    self.authorName = authorName
    self.authorBooksCount = authorBooksCount
  }
}
