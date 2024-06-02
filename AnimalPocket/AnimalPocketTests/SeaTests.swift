//
//  SeaTests.swift
//  AnimalPocketTests
//
//  Created by Sarah Watremet on 17/02/2023.
//

import XCTest
@testable import AnimalPocket

final class SeaTests: XCTestCase {
  var sut: CollectibleViewModel!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CollectibleViewModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testDecreasingPrices() throws {
    // given
    let itemsArray = [CollectibleItem.seaSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.decreasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price > filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testIncreasingPrices() throws {
    // given
    let itemsArray = [CollectibleItem.seaSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.increasePrice(of: itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].price < filteredArray[1].price, "The prices have not been filtered correctly")
  }
  
  func testAlphabeticalOrder() throws {
    // given
    let itemsArray = [CollectibleItem.seaSample, CollectibleItem.fishSample]
    
    // when
    let filteredArray = sut.filter.sortAlphabetically(itemsArray)
    
    // then
    XCTAssertTrue(filteredArray[0].name < filteredArray[1].name)
  }

}
