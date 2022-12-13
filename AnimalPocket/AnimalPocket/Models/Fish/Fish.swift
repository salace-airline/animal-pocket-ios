//
//  Fish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public struct Fish: Identifiable {
  public let id: Int
  public let name: Name
  let availability: Availability
  public let shadow: String
  public let price: Int
  public let imageURI: String
  public let iconURI: String
  
  init(id: Int, name: Name, availability: Availability, shadow: String, price: Int, imageURI: String, iconURI: String) {
    self.id = id
    self.name = name
    self.availability = availability
    self.shadow = shadow
    self.price = price
    self.imageURI = imageURI
    self.iconURI = iconURI
  }
}

extension Fish: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case availability
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}

// MARK: - Fish availability check
extension Fish {
  var period: String {
    if self.availability.time.self == .empty || self.availability.isAllYear == true {
      return "Toute l'année"
    } else {
      return self.availability.time.self.rawValue
    }
  }
  
  var hour: String {
    if self.availability.time.self == .empty || self.availability.isAllDay == true {
      return "Toute la journée"
    } else {
      return self.availability.time.self.rawValue
    }
  }
}

// MARK: - Fish sample
extension Fish {
  static let sample = Fish(id: 78,
                               name: Name(nameEUen: "oarfish", nameEUfr: "poisson ruban"),
                               availability: Availability.init(monthNorthern: "12-5", monthSouthern: "6-11", time: Time.empty, isAllDay: true, isAllYear: false, location: "Sea", rarity: "Rare", monthArrayNorthern: [12,1,2,3,4,5], monthArraySouthern: [6,7,8,9,10,11], timeArray: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]),
                               shadow: "Largest (6)",
                               price: 9000,
                               imageURI: "https://acnhapi.com/v1/images/fish/78",
                               iconURI: "https://acnhapi.com/v1/icons/fish/78")
}
