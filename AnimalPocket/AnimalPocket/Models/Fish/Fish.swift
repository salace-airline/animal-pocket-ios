//
//  Fish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 02/12/2022.
//

import Foundation

struct Fish: Identifiable {
  let id: Int
  let fishName: FishName
  let fishAvailability: FishAvailability
  let shadow: String
  let price: Int
  let imageURI: String
  let iconURI: String
}

extension Fish: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case fishName = "name"
    case fishAvailability = "availability"
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
