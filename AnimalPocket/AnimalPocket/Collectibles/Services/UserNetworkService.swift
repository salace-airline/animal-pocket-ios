//
//  UserNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

enum UserNetworkService {
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
  
  static func updateUserCollection(with parameters: UserItems, path: String) async throws -> UserResponse {
    try await UpdateRequest(userUpdate: parameters, path: path)
      .asURLRequest()
      .fetch(responseType: UserResponse.self)
  }
}
