//
//  FishName.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public struct Name: Codable {
  public var nameEUen: String
  public var nameEUfr: String
  
  init(nameEUen: String, nameEUfr: String) {
    self.nameEUen = nameEUen
    self.nameEUfr = nameEUfr
  }
}

extension Name {
  enum CodingKeys: String, CodingKey {
    case nameEUen = "name-EUen"
    case nameEUfr = "name-EUfr"
  }
}
