//
//  HomeViewModel.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation
import Apollo

class HomeViewModel {
  var userModel: String
  var favoriteBooksModel: [FavoriteBooksQuery.Data.FavoriteBook]
  var favoriteAuthorsModel: [FavoriteAuthorsQuery.Data.FavoriteAuthor]
  var allBooksModel: [AllBooksQuery.Data.AllBook]
  var categoriesBook: [String]
  
  init(userModel: String,
       favoriteBooksModel: [FavoriteBooksQuery.Data.FavoriteBook],
       favoriteAuthorsModel: [FavoriteAuthorsQuery.Data.FavoriteAuthor],
       allBooksModel: [AllBooksQuery.Data.AllBook],
       categoriesBook: [String]) {
    
    self.userModel = userModel
    self.favoriteBooksModel = favoriteBooksModel
    self.favoriteAuthorsModel = favoriteAuthorsModel
    self.allBooksModel = allBooksModel
    self.categoriesBook = categoriesBook
  }
  
  func fetchUserData(complention: @escaping (Result<String, Error>) -> Void) {
    ApolloNetwork.shared.apollo.fetch(query: UserPictureQuery()) { result in
    switch result {
    case .success(let userData):
      self.userModel = userData.data?.userPicture ?? ""
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
  }
  
  func fetchFavoriteBooksData(complention: @escaping (Result<[FavoriteBooksQuery.Data.FavoriteBook], Error>) -> Void) {
    
    ApolloNetwork.shared.apollo.fetch(query: FavoriteBooksQuery()) { result in
    switch result {
    case .success(let favoriteBooksData):
      self.favoriteBooksModel = favoriteBooksData.data?.favoriteBooks ?? [FavoriteBooksQuery.Data.FavoriteBook]()
      complention(.success(self.favoriteBooksModel))
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
  }
  
  func fetchFavoriteAuthorsData(complention: @escaping (Result<[FavoriteAuthorsQuery.Data.FavoriteAuthor], Error>) -> Void) {
    
    ApolloNetwork.shared.apollo.fetch(query: FavoriteAuthorsQuery()) { result in
    switch result {
    case .success(let favoriteAuthorsData):
      self.favoriteAuthorsModel = favoriteAuthorsData.data?.favoriteAuthors ?? [FavoriteAuthorsQuery.Data.FavoriteAuthor]()
      complention(.success(self.favoriteAuthorsModel))
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
  }
  
  func fetchAllBooksData(complention: @escaping (Result<[AllBooksQuery.Data.AllBook], Error>) -> Void) {
    
    ApolloNetwork.shared.apollo.fetch(query: AllBooksQuery()) { result in
    switch result {
    case .success(let allBooksData):
      self.allBooksModel = allBooksData.data?.allBooks ?? [AllBooksQuery.Data.AllBook]()
      complention(.success(self.allBooksModel))
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
  }
  
  func favoriteBooksNumberOfRows(section: Int) -> Int {
    return favoriteBooksModel.count
  }
  
  func favoriteAuthorsNumberOfRows(section: Int) -> Int {
    return favoriteAuthorsModel.count
  }
  
  func allBooksNumberOfRows() -> Int {
    return allBooksModel.count
  }
  
  func idCellFavoriteBook(at indexPath: IndexPath) -> String {
    let favoriteBooks = favoriteBooksModel[indexPath.row]
    return favoriteBooks.id
  }
  
  func cellForRowFavoriteBooks(at indexPath: IndexPath) -> FavoriteBooksViewModelCell {
    let favoriteBooks = favoriteBooksModel[indexPath.row]
    
    return .init(favoriteBookImageName: favoriteBooks.cover,
                 favoriteBookTitle: favoriteBooks.name,
                 favoriteBookAuthorName: favoriteBooks.author.name,
                 favoriteBookID: favoriteBooks.id)
  }
  
  func cellForRowFavoriteAuthors(at indexPath: IndexPath) -> FavoriteAuthorsViewModelCell {
    let favoriteAuthors = favoriteAuthorsModel[indexPath.row]
    
    return .init(authorImageName: favoriteAuthors.picture,
                 authorName: favoriteAuthors.name,
                 authorBooksCount: favoriteAuthors.booksCount)
  }
  
  func cellForRowAllBooks(at row: Int) -> AllBooksViewModelCell {
    let allBooks = allBooksModel[row]
    
    return .init(bookImageName: allBooks.cover,
                 bookTitle: allBooks.name,
                 bookAuthorName: allBooks.author.name)
  }
  
  func cellForRowCategoryBook(at row: Int) -> SegmentedControlCategoryViewModelCell {
    
    let categoryBook = categoriesBook[row]
    
    return .init(categoryBook: categoryBook)
  }
}
