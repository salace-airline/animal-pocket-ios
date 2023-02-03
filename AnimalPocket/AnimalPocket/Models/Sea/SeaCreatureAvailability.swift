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

extension SeaCreatureAvailability {
  var period: String {
    if self.isAllYear == true {
      return "Toute l'année"
    } else {
      return monthsString
    }
  }
  
  var hour: String {
    if self.time.self == .empty || self.isAllDay == true {
      return "Toute la journée"
    } else {
      return self.time.self.rawValue
    }
  }
  
  var monthsString: String {
    var monthArray: [String] = []
    
    for month in self.monthArrayNorthern {
      switch month {
        case 1:
          monthArray.append("January")
        case 2:
          monthArray.append("February")
        case 3:
          monthArray.append("March")
        case 4:
          monthArray.append("April")
        case 5:
          monthArray.append("May")
        case 6:
          monthArray.append("June")
        case 7:
          monthArray.append("July")
        case 8:
          monthArray.append("August")
        case 9:
          monthArray.append("September")
        case 10:
          monthArray.append("October")
        case 11:
          monthArray.append("November")
        case 12:
          monthArray.append("December")
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
  

extension SeaCreatureAvailability {
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

