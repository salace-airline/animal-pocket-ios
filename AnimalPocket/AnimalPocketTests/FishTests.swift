//
//  FishTests.swift
//  AnimalPocketTests
//
//  Created by Sarah Watremet on 17/02/2023.
//

import XCTest
@testable import AnimalPocket

final class FishTests: XCTestCase {
  var sut: FishViewModel!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = FishViewModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testDecreasingPrices() throws {
    // given
    let itemsArray = [Collectible.bugSample, Collectible.fishSample]
    
    // when
    let filteredArray = sut.filter.decreasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price > filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testIncreasingPrices() throws {
    // given
    let itemsArray = [Collectible.bugSample, Collectible.fishSample]
    
    // when
    let filteredArray = sut.filter.increasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price < filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testAlphabeticalOrder() throws {
    // given
    let itemsArray = [Collectible.bugSample, Collectible.fishSample]
    
    // when
    let filteredArray = sut.filter.sortAlphabetically(itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].name.nameEUfr < filteredArray[1].name.nameEUfr)
  }

}
