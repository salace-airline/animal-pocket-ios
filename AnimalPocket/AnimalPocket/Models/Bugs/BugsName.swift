//
//  BugsName.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

struct BugsName {
  let nameEUen: String
  let nameEUfr : String
}

extension BugsName: Decodable {
  enum CodingKeys: String, CodingKey {
    case nameEUen = "name-EUen"
    case nameEUfr = "name-EUfr"
  }
}
