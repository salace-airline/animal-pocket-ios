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
  
  var path: String {
    switch self {
      case .register:
        return "register"
      case .login:
        return "login"
    }
  }
}


