//
//  BugsAvailability.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

struct BugsAvailability {
  let monthNorthern, monthSouthern: String
  let time: String
  let isAllDay, isAllYear: Bool
  let location: String
  let rarity: String
  let monthArrayNorthern, monthArraySouthern: [Int]
  let timeArray: [Int]
}

extension BugsAvailability: Decodable {
  enum CodingKeys: String, CodingKey {
    case monthNorthern = "month-northern"
    case monthSouthern = "month-southern"
    case time, isAllDay, isAllYear, location, rarity
    case monthArrayNorthern = "month-array-northern"
    case monthArraySouthern = "month-array-southern"
    case timeArray = "time-array"
  }
}
