//
//  SSBookUITests.swift
//  SSBookUITests
//
//  Created by Victor Vieira on 31/05/23.
//

import XCTest

final class SSBookUITests: XCTestCase {
  
  func testFavoriteBookCellPressedAndReturn() {
    let app = XCUIApplication()
    app.launch()
    let cellCleanCode = app.scrollViews.otherElements.collectionViews.cells.otherElements.containing(.staticText, identifier:"Clean Code: A Handbook of Agile Software Craftsmanship").element
    cellCleanCode.tap()
    app.navigationBars["Início"].buttons["arrow.backward"].tap()
  }
  
  func testScrollFavoriteBooks() {
    let app = XCUIApplication()
    app.launch()
    
    let elementsFavoriteBooks = XCUIApplication().scrollViews.otherElements
    elementsFavoriteBooks/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 4 pages\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 4 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
    
    let favoriteBooksCollectionViews = elementsFavoriteBooks.collectionViews
    let cellsFavoriteBooks = favoriteBooksCollectionViews.cells
    cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"The Hobbit").element.swipeLeft()
    cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"The Return").element.swipeLeft()
    cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"O Evangelho Segundo um Humorista").element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    favoriteBooksCollectionViews/*@START_MENU_TOKEN@*/.staticTexts["Lonely Planet Chile & Easter Island"]/*[[".cells.staticTexts[\"Lonely Planet Chile & Easter Island\"]",".staticTexts[\"Lonely Planet Chile & Easter Island\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeRight()
  }
}
