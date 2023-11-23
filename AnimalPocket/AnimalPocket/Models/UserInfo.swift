//
//  SignUpRequest.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

public struct UserInfo: Encodable {
  public let email: String
  public let password: String
}

public struct AuthResponse: Decodable {
  public let data: UserResponse
  public let message: String
  public let status: String
}

public struct UserResponse {
  public let id: Int?
  public let email: String
  public let caughtFish: [Int]
  public let caughtBug: [Int]
  public let caughtSeaCreature: [Int]
}

extension UserResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case id
    case email
    case caughtFish = "caught_fish"
    case caughtBug = "caught_bug"
    case caughtSeaCreature = "caught_sea_creature"
  }
}

public struct Response: Decodable {
  public let message: String
  public let status: String
}

public struct UpdateFish {
  public let caughtFish: Int
}

extension UpdateFish: Codable {
  enum CodingKeys: String, CodingKey {
    case caughtFish = "caught_fish"
  }
}

public struct UpdateBug {
  public let caughtBug: Int
}

extension UpdateBug: Codable {
  enum CodingKeys: String, CodingKey {
    case caughtBug = "caught_bug"
  }
}

public struct UpdateSeaCreature {
  public let caughtSeaCreature: Int
}

extension UpdateSeaCreature: Codable {
  enum CodingKeys: String, CodingKey {
    case caughtSeaCreature = "caught_sea_creature"
  }
}

