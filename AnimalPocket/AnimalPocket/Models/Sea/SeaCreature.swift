//
//  SeaCreature.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

struct SeaCreature: Identifiable {
  let id: Int
  let name: Name
  let seaCreatureAvailability: SeaCreatureAvailability
  let speed: String
  let shadow: String
  let price: Int
  let imageURI: String
  let iconURI: String
}

extension SeaCreature: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case seaCreatureAvailability = "availability"
    case speed
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
