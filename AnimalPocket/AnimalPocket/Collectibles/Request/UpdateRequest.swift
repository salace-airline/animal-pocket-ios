//
//  UpdateRequest.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

final class UpdateRequest: APIRequest {
  let userUpdate: UserItems
  
  init(userUpdate: UserItems, path: String) {
    self.userUpdate = userUpdate
    super.init(path: path)
  }
  
  override func asURLRequest() throws -> URLRequest {
    var request = try super.asURLRequest()
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "PATCH"
    
    request.httpBody = try JSONEncoder().encode(userUpdate)
    
    return request
  }
}
