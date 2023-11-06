//
//  UserRequest.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

final class AuthRequest: APIRequest {
  let userParameters: UserInfo
  
  init(userParameters: UserInfo, path: String) {
    self.userParameters = userParameters
    super.init(path: path)
  }
  
  override func asURLRequest() throws -> URLRequest {
    var request = try super.asURLRequest()
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "POST"
    
    request.httpBody = try JSONEncoder().encode(userParameters)
    
    return request
  }
}
