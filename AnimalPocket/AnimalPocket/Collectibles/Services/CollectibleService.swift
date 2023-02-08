//
//  CollectibleService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

// Public service that will be accessed by the ViewModels
public enum CollectibleService {
  public static func fetchCollectibles(path: String) async throws -> [Collectible] {
    try await CollectibleNetworkService.fetchCollectibles(path: path)
  }
}
