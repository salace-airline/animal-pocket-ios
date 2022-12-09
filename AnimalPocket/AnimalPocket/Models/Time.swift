//
//  Time.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

enum Time: String, Codable {
  case empty = ""
  case bet4Am9Pm = "4am - 9pm"
  case bet4Pm9Am = "4pm - 9am"
  case bet9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
  case bet9Pm4Am = "9pm - 4am"
}
