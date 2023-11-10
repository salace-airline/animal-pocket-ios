//
//  UserRouter.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 02/11/2023.
//

import Foundation

enum UserRouter {
  case register
  case login
  case update
  
  var path: String {
    switch self {
      case .register:
        return "register"
      case .login:
        return "login"
      case .update:
        return "user"
    }
  }
}


