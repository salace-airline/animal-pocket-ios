//
//  SeaCreature.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

struct SeaCreature: Identifiable {
  let id: Int
  let name: Name
  let seaCreatureAvailability: SeaCreatureAvailability
  let speed: String
  let shadow: String
  let price: Int
  let imageURI: String
  let iconURI: String
  
  init(id: Int, name: Name, seaCreatureAvailability: SeaCreatureAvailability, speed: String, shadow: String, price: Int, imageURI: String, iconURI: String) {
    self.id = id
    self.name = name
    self.seaCreatureAvailability = seaCreatureAvailability
    self.speed = speed
    self.shadow = shadow
    self.price = price
    self.imageURI = imageURI
    self.iconURI = iconURI
  }
}

extension SeaCreature: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case seaCreatureAvailability = "availability"
    case speed
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}

// MARK: - Sea Creature availability check
extension SeaCreature {
  var period: String {
    if self.seaCreatureAvailability.time.self == .empty || self.seaCreatureAvailability.isAllYear == true {
      return "Toute l'année"
    } else {
      return self.seaCreatureAvailability.time.self.rawValue
    }
  }
  
  var hour: String {
    if self.seaCreatureAvailability.time.self == .empty || self.seaCreatureAvailability.isAllDay == true {
      return "Toute la journée"
    } else {
      return self.seaCreatureAvailability.time.self.rawValue
    }
  }
}

// MARK: - Sea Creature sample
extension SeaCreature {
  static let sample = SeaCreature(id: 26,
                                  name: Name(nameEUen: "snow crab", nameEUfr: "crabe des neiges"),
                                  seaCreatureAvailability: SeaCreatureAvailability(monthNorthern: "11-4", monthSouthern: "5-10", time: Time.empty, isAllDay: true, isAllYear: false, monthArrayNorthern: [11,12,1,2,3,4], monthArraySouthern: [5,6,7,8,9,10], timeArray: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]),
                                  speed: "Fast",
                                  shadow: "Large",
                                  price: 6000,
                                  imageURI: "https://acnhapi.com/v1/images/sea/26",
                                  iconURI: "https://acnhapi.com/v1/icons/sea/26")
}

