//
//  UserService.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

public struct UserService {
  
  /// MARK - User
  public static func registerUser(with parameters: UserInfo, path: String) async throws -> UserResponse {
    let userResponse = try await UserNetworkService.registerUser(with: parameters, path: path)
    return userResponse
  }
  
  public static func loginUser(with parameters: UserInfo, path: String) async throws -> AuthResponse {
    let loginResponse = try await UserNetworkService.loginUser(with: parameters, path: path)
    return loginResponse
  }
  
  public static func getUser(with path: String) async throws -> UserResponse {
    let user = try await UserNetworkService.getUser(with: path)
    return user
  }
  
  /// MARK - Collection updates
  public static func updateFishCollection(with fishNumber: UpdateFish, path: String) async throws -> Response {
    let updateResponse = try await UserNetworkService.updateFishCollection(with: fishNumber, path: path)
    return updateResponse
  }
  
  public static func updateBugCollection(with bugNumber: UpdateBug, path: String) async throws -> Response {
    let updateResponse = try await UserNetworkService.updateBugCollection(with: bugNumber, path: path)
    return updateResponse
  }
  
  public static func updateSeaCollection(with seaCreatureNumber: UpdateSeaCreature, path: String) async throws -> Response {
    let updateResponse = try await UserNetworkService.updateSeaCreatureCollection(with: seaCreatureNumber, path: path)
    return updateResponse
  }
}
