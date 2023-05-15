//
//  ImageProviderTest.swift
//  ImageProviderTest
//
//  Created by Victor Vieira on 11/10/22.
//

@testable import SSBook
import XCTest

final class ImageProviderTest: XCTestCase {
  var image: UIImage?

  override func setUp() {
    super.setUp()
  }
  
  func testImageEmpty() throws {
    guard let url = URL(string: "") else { return }
    ImageProvider.shared.fecthImage(url: url) { [weak self] image in
      self?.image = image
    }
    
    guard let image = image else { return }
    XCTAssertNotNil(image)
  }
  
}
