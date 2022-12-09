//
//  SeaCreatureName.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

struct SeaCreatureName {
  let nameEUen: String
  let nameEUfr : String
}

extension SeaCreatureName: Decodable {
  enum CodingKeys: String, CodingKey {
    case nameEUen = "name-EUen"
    case nameEUfr = "name-EUfr"
  }
}

