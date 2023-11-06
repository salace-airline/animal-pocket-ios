//
//  APIRequest.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

// Request for the common URL
class APIRequest: Request {
  private let baseURL = URL(string: "http://13.39.189.214:3000")
  private let path: String
  
  init(path: String) {
    self.path = path
  }
  
  func asURLRequest() throws -> URLRequest {
    guard var baseURL else {
      throw NetworkingError.issueWithURL
    }
    
    if !path.isEmpty {
      baseURL.appendPathComponent(path)
    }
    
    let request = URLRequest(url: baseURL)
    return request
  }
}
