//
//  AllBooksViewModelCell.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation

class AllBooksViewModelCell {
  
  var bookImageName: String
  var bookTitle: String
  var bookAuthorName: String
  
  
  init(bookImageName: String,
       bookTitle: String,
       bookAuthorName: String) {
    
    self.bookImageName = bookImageName
    self.bookTitle = bookTitle
    self.bookAuthorName = bookAuthorName
  }
}
