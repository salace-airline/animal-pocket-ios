//
//  UserService.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

public struct UserService {
  public static func registerUser(with parameters: UserInfo, path: String) async throws -> UserResponse {
    let userResponse = try await UserNetworkService.registerUser(with: parameters, path: path)
    return userResponse
  }
  
  public static func loginUser(with parameters: UserInfo, path: String) async throws -> AuthResponse {
    let loginResponse = try await UserNetworkService.loginUser(with: parameters, path: path)
    return loginResponse
  }
  
  public static func updateUserCollection(with itemNumber: Int, path: String) async throws -> UserItems {
    let updateResponse = try await UserNetworkService.updateUserCollection(with: itemNumber, path: path)
    return updateResponse
  }
  
  public static func getUser(with path: String) async throws -> AuthResponse {
    let user = try await UserNetworkService.getUser(with: path)
    return user
  }
}
