//
//  CategoryRouter.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

enum CategoryRouter {
  case fish
  case bug
  case seaCreature
  
  var path: String {
    switch self {
      case .fish:
        return "fish"
      case .bug:
        return "bug"
      case .seaCreature:
        return "sea-creature"
    }
  }
}
