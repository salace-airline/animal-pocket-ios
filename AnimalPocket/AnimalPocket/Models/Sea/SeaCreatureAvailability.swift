//
//  SeaCreatureAvailability.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

struct SeaCreatureAvailability {
  let monthNorthern, monthSouthern: String
  let time: Time
  let isAllDay, isAllYear: Bool
//  let rarity: String
  let monthArrayNorthern, monthArraySouthern: [Int]
  let timeArray: [Int]
}

extension SeaCreatureAvailability: Decodable {
  enum CodingKeys: String, CodingKey {
    case monthNorthern = "month-northern"
    case monthSouthern = "month-southern"
    case time, isAllDay, isAllYear
//    case rarity
    case monthArrayNorthern = "month-array-northern"
    case monthArraySouthern = "month-array-southern"
    case timeArray = "time-array"
  }
}
