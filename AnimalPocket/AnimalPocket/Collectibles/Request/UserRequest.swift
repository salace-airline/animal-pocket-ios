//
//  UserRequest.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 17/11/2023.
//

import Foundation

final class UserRequest: APIRequest {
  override init(path: String) {
    super.init(path: path)
  }
  
  override func asURLRequest() throws -> URLRequest {
    var request = try super.asURLRequest()
    request.httpMethod = "GET"
    
    return request
  }
}
