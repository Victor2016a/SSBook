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
    let cellCleanCode = app.scrollViews.otherElements.collectionViews.cells.otherElements.containing(.staticText, identifier:"Clean Code: A Handbook of Agile Software Craftsmanship").element
    let navigationBackButton = app.navigationBars["Início"].buttons["arrow.backward"]
    
    app.launch()
    cellCleanCode.tap()
    navigationBackButton.tap()
  }
  
  func testScrollFavoriteBooks() {
    let app = XCUIApplication()
    app.launch()
    
    let elementsFavoriteBooks = XCUIApplication().scrollViews.otherElements
    let firstsElementsFavoriteBooks = XCUIApplication().scrollViews.otherElements/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 4 pages\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 4 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    let favoriteBooksCollectionViews = elementsFavoriteBooks.collectionViews
    let cellsFavoriteBooks = favoriteBooksCollectionViews.cells
    
    let cellHobbit = cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"The Hobbit").element
    let cellReturn = cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"The Return").element
    let cellHumorista = cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"O Evangelho Segundo um Humorista").element
    let cellLonely = cellsFavoriteBooks.otherElements.containing(.staticText, identifier:"Lonely Planet Chile & Easter Island").element
    
    firstsElementsFavoriteBooks.swipeLeft()
    cellHobbit.swipeLeft()
    cellReturn.swipeLeft()
    cellHumorista.swipeRight()
    cellLonely.swipeRight()
  }
}
