//
//  FishAvailability.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public struct FishAvailability {
  public let monthNorthern, monthSouthern: String
  public let time: String
  public let isAllDay, isAllYear: Bool
  public let location: String
  public let rarity: String
  public let monthArrayNorthern, monthArraySouthern: [Int]
  public let timeArray: [Int]
}

extension FishAvailability: Decodable {
  enum CodingKeys: String, CodingKey {
    case monthNorthern = "month-northern"
    case monthSouthern = "month-southern"
    case time, isAllDay, isAllYear, location, rarity
    case monthArrayNorthern = "month-array-northern"
    case monthArraySouthern = "month-array-southern"
    case timeArray = "time-array"
  }
}
