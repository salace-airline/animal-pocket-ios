//
//  BugsName.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

struct Name {
  let nameEUen: String
  let nameEUfr : String
}

extension Name: Codable {
  enum CodingKeys: String, CodingKey {
    case nameEUen = "name-EUen"
    case nameEUfr = "name-EUfr"
  }
}
