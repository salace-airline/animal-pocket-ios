//
//  UserItems.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

public class UserItems: Codable, ObservableObject {
  public let caughtFish: [Int]
  public let caughtBug: [Int]
  public let caughtSeaCreature: [Int]
  
  init(caughtFish: [Int], caughtBug: [Int], caughtSeaCreature: [Int]) {
    self.caughtFish = caughtFish
    self.caughtBug = caughtBug
    self.caughtSeaCreature = caughtSeaCreature
  }
}
