//
//  CollectibleService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public enum CollectibleService {
  public static func fetchCollectibles(path: String) async throws -> [Collectible] {
    try await CollectibleNetworkService.fetchCollectibles(path: path)
  }
}
