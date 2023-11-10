//
//  CollectibleItem.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 17/02/2023.
//

import Foundation

class Categories: Codable, ObservableObject {
  var fish: [CollectibleItem]
  var bugs: [CollectibleItem]
  var sea: [CollectibleItem]
}

class CollectibleItem: Identifiable, Codable, ObservableObject {
  var id = UUID()
  var itemNumber: Int
  var name: String
  var monthNorthern: String
  var monthSouthern: String
  var monthArrayNorthern: [Int]
  var monthArraySouthern: [Int]
  var availableTime: Time
  var availableTimeArray: [Int]
  var isAllDay, isAllYear: Bool
  var location: String?
  var rarity: Rarity?
  var speed: String?
  var shadow: String?
  var price: Int
  var iconURI: String
//  var isCollected: Bool
  
  init(
    itemNumber: Int,
    name: String,
    monthNorthern: String,
    monthSouthern: String,
    monthArrayNorthern: [Int],
    monthArraySouthern: [Int],
    availableTime: Time,
    availableTimeArray: [Int],
    isAllDay: Bool,
    isAllYear: Bool,
    location: String?,
    rarity: Rarity?,
    speed: String?,
    shadow: String?,
    price: Int,
    iconURI: String
//    isCollected: Bool
  ) {
    self.itemNumber = itemNumber
    self.name = name
    self.monthNorthern = monthNorthern
    self.monthSouthern = monthSouthern
    self.monthArrayNorthern = monthArrayNorthern
    self.monthArraySouthern = monthArraySouthern
    self.availableTime = availableTime
    self.availableTimeArray = availableTimeArray
    self.isAllDay = isAllDay
    self.isAllYear = isAllYear
    self.location = location
    self.rarity = rarity
    self.speed = speed
    self.shadow = shadow
    self.price = price
    self.iconURI = iconURI
//    self.isCollected = isCollected
  }
}

// MARK - Availability helpers
extension CollectibleItem {
  var period: String {
    if self.isAllYear == true {
      return "All year long"
    } else {
      return monthsString
    }
  }
  
  var hour: String {
    if self.availableTime.self == .empty || self.isAllDay == true {
      return "All day long"
    } else {
      return self.availableTime.self.rawValue
    }
  }
  
  var monthsString: String {
    var monthArray: [String] = []
    
    for month in self.monthArrayNorthern {
      switch month {
        case 1:
          monthArray.append("Jan")
        case 2:
          monthArray.append("Feb")
        case 3:
          monthArray.append("Mar")
        case 4:
          monthArray.append("Apr")
        case 5:
          monthArray.append("May")
        case 6:
          monthArray.append("Jun")
        case 7:
          monthArray.append("Jul")
        case 8:
          monthArray.append("Aug")
        case 9:
          monthArray.append("Sep")
        case 10:
          monthArray.append("Oct")
        case 11:
          monthArray.append("Nov")
        case 12:
          monthArray.append("Dec")
        default:
          monthArray.append("R")
      }
    }
    
    var finalMonthString: String {
      if monthArray.first! == monthArray.last! {
        return monthArray.first!
      } else {
        return [monthArray.first!, monthArray.last!].joined(separator: " - ")
      }
    }
    return finalMonthString
  }
}

extension CollectibleItem {
  // returns user's current month in a numeric format
  var currentMonth: Int? {
    let currentDate = Date.now
    let formatter = DateFormatter()
    formatter.dateFormat = "M"
    
    return Int(formatter.string(from: currentDate))
  }
  
  // returns user's current time of the day in a numeric format
  var currentTime: Int? {
    let currentTime = Date.now
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    
    return Int(formatter.string(from: currentTime))
  }
}

extension CollectibleItem {
  static let bugSample = CollectibleItem(
    itemNumber: 80,
    name: "scorpion",
    monthNorthern: "5-10",
    monthSouthern: "11-4",
    monthArrayNorthern: [5,6,7,8,9,10],
    monthArraySouthern: [11,12,1,2,3,4],
    availableTime: Time.bet7pm4am,
    availableTimeArray: [19,20,21,22,23,0,1,2,3],
    isAllDay: false,
    isAllYear: false,
    location: "On the ground",
    rarity: .ultraRare,
    speed: nil,
    shadow: nil,
    price: 8000,
    iconURI: "https://raw.githubusercontent.com/salace-airline/ACNHAPI/master/icons/bugs/scorpion.png"
//    isCollected: true
  )
  
  static let fishSample = CollectibleItem(
    itemNumber: 80,
    name: "coelacanth",
    monthNorthern: "",
    monthSouthern: "",
    monthArrayNorthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    monthArraySouthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    availableTime: .empty,
    availableTimeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
    isAllDay: true,
    isAllYear: true,
    location: "Sea (when raining or snowing)",
    rarity: .ultraRare,
    speed: nil,
    shadow: "Largest (6)",
    price: 15000,
    iconURI: "https://raw.githubusercontent.com/salace-airline/ACNHAPI/master/icons/fish/coelacanth.png"
//    isCollected: false
  )
  
  static let seaSample = CollectibleItem(
    itemNumber: 40,
    name: "Venus' flower basket",
    monthNorthern: "10-2",
    monthSouthern: "4-8",
    monthArrayNorthern: [10, 11, 12, 1, 2],
    monthArraySouthern: [4, 5, 6, 7, 8],
    availableTime: .empty,
    availableTimeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
    isAllDay: true,
    isAllYear: false,
    location: nil,
    rarity: nil,
    speed: "Fast",
    shadow: "Medium",
    price: 5000,
    iconURI: "https://raw.githubusercontent.com/salace-airline/ACNHAPI/master/icons/sea/venus_flower_basket.png"
//    isCollected: true
  )
}
