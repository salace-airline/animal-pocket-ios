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
  case user
  case updateFish
  case updateBug
  case updateSea
  
  var path: String {
    switch self {
      case .register:
        return "register"
      case .login:
        return "login"
      case .user:
        return "user"
      case .updateFish:
        return "user/fish"
      case .updateBug:
        return "user/bug"
      case .updateSea:
        return "user/sea-creature"
    }
  }
}


