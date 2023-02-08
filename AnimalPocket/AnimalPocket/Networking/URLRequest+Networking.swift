//
//  URLRequest+Networking.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public extension URLRequest {
  func fetch<Element: Decodable>(responseType: Element.Type) async throws -> Element {
    let (data, response) = try await URLSession.shared.data(for: self)
    
    guard let response = response as? HTTPURLResponse else {
      throw NetworkingError.invalidResponse
    }
    
    let statusCode = response.statusCode
    guard statusCode >= 200 && statusCode <= 299 else {
      throw NetworkingError.errorWhileFetchingData(statusCode: statusCode)
    }
    
    let networkingResponse = try JSONDecoder().decode(Element.self, from: data)
    return networkingResponse
  }
}
