//
//  CollectibleNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

enum CollectibleNetworkService {
  static func fetchCollectibles(path: String) async throws -> [Collectible] {
    try await CollectibleRequest(path: path)
      .asURLRequest()
      .fetch(responseType: [Collectible].self)
  }
}
