//
//  Collectible.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public struct Collectible: Identifiable {
  public let id: Int
  public let name: Name
  public let availability: Availability
  public let speed: String?
  public let shadow: String?
  public let price: Int
  public let imageURI: String
  public let iconURI: String
  
  init(id: Int, name: Name, availability: Availability, speed: String?, shadow: String?, price: Int, imageURI: String, iconURI: String) {
    self.id = id
    self.name = name
    self.availability = availability
    self.speed = speed
    self.shadow = shadow
    self.price = price
    self.imageURI = imageURI
    self.iconURI = iconURI
  }
}

extension Collectible: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case availability
    case speed
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}

// MARK: - Collectible sample
extension Collectible {
  static let bugSample = Collectible(id: 80,
                                     name: Name(nameEUen: "scorpion", nameEUfr: "scorpion"),
                                     availability: Availability(monthNorthern: "5-10",
                                                                monthSouthern: "11-4",
                                                                time: Time.bet7pm4am,
                                                                isAllDay: false,
                                                                isAllYear: false,
                                                                location: "On the ground",
                                                                rarity: Rarity.ultraRare,
                                                                monthArrayNorthern: [5,6,7,8,9,10],
                                                                monthArraySouthern: [11,12,1,2,3,4],
                                                                timeArray: [19,20,21,22,23,0,1,2,3]),
                                     speed: nil,
                                     shadow: nil,
                                     price: 8000,
                                     imageURI: "https://acnhapi.com/v1/images/bugs/80",
                                     iconURI: "https://acnhapi.com/v1/icons/bugs/80"
  )
  
  static let fishSample = Collectible(id: 80,
                                      name: Name(nameEUen: "coelacanth", nameEUfr: "cœlacanthe"),
                                      availability: Availability(monthNorthern: "",
                                                                 monthSouthern: "",
                                                                 time: .empty,
                                                                 isAllDay: true,
                                                                 isAllYear: true,
                                                                 location: "Sea (when raining or snowing)",
                                                                 rarity: Rarity.ultraRare,
                                                                 monthArrayNorthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                                                                 monthArraySouthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                                                                 timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                                      speed: nil,
                                      shadow: "Largest (6)",
                                      price: 15000,
                                      imageURI: "https://acnhapi.com/v1/images/fish/80",
                                      iconURI: "https://acnhapi.com/v1/icons/fish/80"
  )
  
  static let seaSample = Collectible(id: 40,
                                      name: Name(nameEUen: "Venus' flower basket", nameEUfr: "Corbeille de Vénus"),
                                      availability: Availability(monthNorthern: "10-2",
                                                                 monthSouthern: "4-8",
                                                                 time: .empty,
                                                                 isAllDay: true,
                                                                 isAllYear: false,
                                                                 location: nil,
                                                                 rarity: nil,
                                                                 monthArrayNorthern: [10, 11, 12, 1, 2],
                                                                 monthArraySouthern: [4, 5, 6, 7, 8],
                                                                 timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                                      speed: "Fast",
                                      shadow: "Medium",
                                      price: 5000,
                                      imageURI: "https://acnhapi.com/v1/images/sea/40",
                                      iconURI: "https://acnhapi.com/v1/icons/sea/40"
  )
}
