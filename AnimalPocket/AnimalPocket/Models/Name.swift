//
//  FishName.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public struct Name {
  public let nameEUen: String
  public let nameEUfr: String
  
  init(nameEUen: String, nameEUfr: String) {
    self.nameEUen = nameEUen.capitalized
    self.nameEUfr = nameEUfr.capitalized
  }
}

extension Name: Decodable {
  enum CodingKeys: String, CodingKey {
    case nameEUen = "name-EUen"
    case nameEUfr = "name-EUfr"
  }
}
