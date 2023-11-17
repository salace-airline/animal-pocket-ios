//
//  UpdateRequest.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

final class UpdateRequest: APIRequest {
  let itemNumber: Int
  
  init(itemNumber: Int, path: String) {
    self.itemNumber = itemNumber
    super.init(path: path)
  }
  
  override func asURLRequest() throws -> URLRequest {
    var request = try super.asURLRequest()
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "PATCH"
    
    request.httpBody = try JSONEncoder().encode(itemNumber)
    
    return request
  }
}
