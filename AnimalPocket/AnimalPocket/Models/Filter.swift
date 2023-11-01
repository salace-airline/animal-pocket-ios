//
//  Filter.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/01/2023.
//

import Foundation

enum Filter {
  case noFilter
  case increasingPrice
  case decreasingPrice
  case alphatically
}

// Price filters
extension Filter {
  func decreasePrice(of items: [CollectibleItem]) -> [CollectibleItem] {
    items.sorted(by: {
      $0.price > $1.price
    })
  }
  
  func increasePrice(of items: [CollectibleItem]) -> [CollectibleItem] {
    items.sorted(by: {
      $0.price < $1.price
    })
  }
}

// Alphabetical filter
extension Filter {
  func sortAlphabetically(_ items: [CollectibleItem]) -> [CollectibleItem] {
    items.sorted(by: {
      $0.name < $1.name
    })
  }
}
