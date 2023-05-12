//
//  CategoryRouter.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

enum CategoryRouter {
  case fish
  case bugs
  case sea
  
  var path: String {
    switch self {
      case .fish:
        return "fish"
      case .bugs:
        return "bugs"
      case .sea:
        return "sea"
    }
  }
}
