//
//  BugsResponse.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

struct BugsResponse {
  let id: Int
  let name: Name
  let availability: Availability
  let price: Int
  let imageUri: String
  let iconUri: String
}

extension BugsResponse {
  enum CodingKeys: String, CodingKey {
    case id
    case fileName = "file-name"
    case name, availability, price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
