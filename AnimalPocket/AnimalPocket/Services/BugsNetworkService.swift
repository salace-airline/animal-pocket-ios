//
//  BugsNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

public enum BugsError: Error {
  case issueWithURL
  case invalidResponse
  case errorWhileFetchingData(statusCode: Int)
}

enum BugsNetworkService {
  static func fetchBugs() async throws -> BugsResponse {
    let url = URL(string: "https://acnhapi.com/v1/bugs")
    guard let url else {
      throw BugsError.issueWithURL
    }
    let urlRequest = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse else {
      throw BugsError.invalidResponse
    }
    
    let statusCode = response.statusCode
    guard statusCode >= 200 && statusCode <= 299 else {
      throw BugsError.errorWhileFetchingData(statusCode: statusCode)
    }
    
    let bugsResponse = try JSONDecoder().decode(BugsResponse.self, from: data)
    return bugsResponse
  }
}
