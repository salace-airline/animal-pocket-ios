//
//  SeaCreatureNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public enum SeaCreatureError: Error {
  case issueWithURL
  case invalidResponse
  case errorWhileFetchingData(statusCode: Int)
}

enum SeaCreatureNetworkService {
  static func fetchSeaCreature() async throws -> [SeaCreature] {
    let url = URL(string: "https://acnhapi.com/v1a/sea")
    guard let url else {
      throw SeaCreatureError.issueWithURL
    }
    let urlRequest = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse else {
      throw SeaCreatureError.invalidResponse
    }
    
    let statusCode = response.statusCode
    guard statusCode >= 200 && statusCode <= 299 else {
      throw SeaCreatureError.errorWhileFetchingData(statusCode: statusCode)
    }
    
    let seaCreatureResponse = try JSONDecoder().decode([SeaCreature].self, from: data)
    return seaCreatureResponse
  }
}
