//
//  UserNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

enum UserNetworkService {
  
  /// MARK - User
  static func registerUser(with parameters: UserInfo, path: String) async throws -> UserResponse {
    try await AuthRequest(userParameters: parameters, path: path)
      .asURLRequest()
      .fetch(responseType: UserResponse.self)
  }
  
  static func loginUser(with parameters: UserInfo, path: String) async throws -> AuthResponse {
    try await AuthRequest(userParameters: parameters, path: path)
      .asURLRequest()
      .fetch(responseType: AuthResponse.self)
  }
  
  static func getUser(with path: String) async throws -> UserResponse {
    try await UserRequest(path: path)
      .asURLRequest()
      .fetch(responseType: UserResponse.self)
  }
  
  /// MARK - Collection Updates
  static func updateFishCollection(with fishNumber: UpdateFish, path: String) async throws -> Response {
    try await FishUpdateRequest(itemNumber: fishNumber, path: path)
      .asURLRequest()
      .fetch(responseType: Response.self)
  }
  
  static func updateBugCollection(with bugNumber: UpdateBug, path: String) async throws -> Response {
    try await BugUpdateRequest(itemNumber: bugNumber, path: path)
      .asURLRequest()
      .fetch(responseType: Response.self)
  }
  
  static func updateSeaCreatureCollection(with seaCreatureNumber: UpdateSeaCreature, path: String) async throws -> Response {
    try await SeaCreatureUpdateRequest(itemNumber: seaCreatureNumber, path: path)
      .asURLRequest()
      .fetch(responseType: Response.self)
  }
}
