//
//  DetailsBookViewModel.swift
//  SSBook
//
//  Created by Victor Vieira on 25/09/22.
//

import Foundation
import Apollo

class DetailsBookViewModel {
  
  var detailsBookModel: FavoriteBookQuery.Data.Book
  
  init(detailsBookModel: FavoriteBookQuery.Data.Book) {
    self.detailsBookModel = detailsBookModel
  }
  
  func fetchDetailsBookData(with id: String, complention: @escaping (Result<FavoriteBookQuery.Data.Book, Error>) -> Void) {
    ApolloNetwork.shared.apollo.fetch(query: FavoriteBookQuery(id: id)) { result in
    switch result {
    case .success(let detailsBookData):
      self.detailsBookModel = detailsBookData.data?.book ?? FavoriteBookQuery.Data.Book.init(cover: "", name: "", author: FavoriteBookQuery.Data.Book.Author.init(name: ""), description: "")
      complention(.success(self.detailsBookModel))
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
  }
  
  func stackForInformationBook() -> InformationBookViewModel {
    let informationBook = detailsBookModel
    
    return .init(imageBookName: informationBook.cover,
                 bookTitle: informationBook.name,
                 authorName: informationBook.author.name,
                 bookDescription: informationBook.description)
  }
}
