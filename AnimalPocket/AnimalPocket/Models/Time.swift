//
//  Time.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public enum Time: String, Codable {
  case empty = ""
  case bet4Am9Pm = "4am - 9pm"
  case bet4am7pm = "4am - 7pm"
  case bet4am5pm = "4am - 5pm"
  case bet4Pm9Am = "4pm - 9am"
  case bet4pm11pm = "4pm - 11pm"
  case bet5pm8am = "5pm - 8am"
  case bet5pm4am = "5pm - 4am"
  case bet7pm4am = "7pm - 4am"
  case bet7pm8am = "7pm - 8am"
  case bet8am7pm = "8am - 7pm"
  case bet8am4pm = "8am - 4pm"
  case bet8am5pm = "8am - 5pm"
  case bet9am4pm = "9am - 4pm"
  case bet4am8am4pm7pm = "4am - 8am & 4pm - 7pm"
  case bet4am8am5pm7pm = "4am - 8am & 5pm - 7pm"
  case bet9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
  case bet9Pm4Am = "9pm - 4am"
  case bet11pm4pm = "11pm - 4pm"
  case bet11pm8am = "11pm - 8am"
}
