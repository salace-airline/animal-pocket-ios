//
//  Collectible.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public struct Collectible: Identifiable {
  public let id: Int
  public let name: String
  public var monthNorthern,
             monthSouthern: String
  public var monthArrayNorthern: [Int]
  public var monthArraySouthern: [Int]
  public var availableTime: Time
  public var availableTimeArray: [Int]
  public var isAllDay, isAllYear: Bool
  public var location: String?
  public var rarity: Rarity?
  public let speed: String?
  public let shadow: String?
  public let price: Int
  public let imageURI: String
  public let iconURI: String
}

extension Collectible: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "ID"
    case name
    case monthNorthern = "month_northern"
    case monthSouthern = "month-southern"
    case monthArrayNorthern = "month_northern_array"
    case monthArraySouthern = "month_southern_array"
    case availableTime = "available_time"
    case availableTimeArray = "available_time_array"
    case isAllDay = "is_all_day"
    case isAllYear = "is_all_year"
    case location
    case rarity
    case speed
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
