//
//  Bug.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

struct Bug: Identifiable {
  let id: Int
  let name: Name
  let availability: Availability
  let price: Int
  let imageURI: String
  let iconURI: String
}

extension Bug: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case availability 
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
