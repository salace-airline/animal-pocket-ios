//
//  BugsTests.swift
//  AnimalPocketTests
//
//  Created by Céline Barbe on 28/10/2022.
//

import XCTest
@testable import AnimalPocket

final class BugsTests: XCTestCase {
  var sut: BugsViewModel!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = BugsViewModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testDecreasingPrices() throws {
    // given
    let itemsArray = [CollectibleItem.bugSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.decreasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price > filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testIncreasingPrices() throws {
    // given
    let itemsArray = [CollectibleItem.bugSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.increasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price < filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testAlphabeticalOrder() throws {
    // given
    let itemsArray = [CollectibleItem.bugSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.sortAlphabetically(itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].name.nameEUfr < filteredArray[1].name.nameEUfr)
  }
  
}
