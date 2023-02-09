//
//  NetworkingError.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public enum NetworkingError: Error {
  case issueWithURL
  case invalidResponse
  case errorWhileFetchingData(statusCode: Int)
  case errorWhileDecodingData
}
