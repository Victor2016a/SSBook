//
//  HomeViewModelTest.swift
//  HomeViewModelTest
//
//  Created by Victor Vieira on 11/10/22.
//

@testable import SSBook
import XCTest

final class HomeViewModelTest: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  func testViewModelEmpty() throws {
    let viewModel = HomeViewModel(userModel: "",
                                  favoriteBooksModel: [],
                                  favoriteAuthorsModel: [],
                                  allBooksModel: [])
    XCTAssertNotNil(viewModel)
  }
  
  
}
