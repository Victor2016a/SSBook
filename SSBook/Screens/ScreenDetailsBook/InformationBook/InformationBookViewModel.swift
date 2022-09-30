//
//  InformationOfBookViewModel.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation

class InformationBookViewModel {
  
  var imageBookName: String
  var bookTitle: String
  var authorName: String
  var bookDescription: String
  
  init(imageBookName: String,
       bookTitle: String,
       authorName: String,
       bookDescription: String) {
    
    self.imageBookName = imageBookName
    self.bookTitle = bookTitle
    self.authorName = authorName
    self.bookDescription = bookDescription
  }
}
