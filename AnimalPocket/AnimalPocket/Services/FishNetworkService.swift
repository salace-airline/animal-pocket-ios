//
//  FishNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public enum FishError: Error {
  case issueWithURL
  case invalidResponse
  case errorWhileFetchingData(statusCode: Int)
}

enum FishNetworkService {
  static func fetchFish() async throws -> [Fish] {
    let url = URL(string: "https://acnhapi.com/v1a/fish")
    guard let url else {
      throw BugsError.issueWithURL
    }
    let urlRequest = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse else {
      throw FishError.invalidResponse
    }
    
    let statusCode = response.statusCode
    guard statusCode >= 200 && statusCode <= 299 else {
      throw FishError.errorWhileFetchingData(statusCode: statusCode)
    }
    
    let fishResponse = try JSONDecoder().decode([Fish].self, from: data)
    return fishResponse
  }
}
