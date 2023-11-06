//
//  CategoryRequest.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

// Request that will take the path as parameter
final class CategoryRequest: APIRequest {
  override init(path: String) {
    super.init(path: path)
  }
  
  override func asURLRequest() throws -> URLRequest {
    var request = try super.asURLRequest()
    request.httpMethod = "GET"
    
    return request
  }
}
