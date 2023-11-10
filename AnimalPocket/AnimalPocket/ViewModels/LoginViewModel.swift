//
//  LoginViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  @Published var caughtItems: [UserItems] = []
  
  @MainActor
  func register() async {
    Task {
      do {
        let registration = try await UserService.registerUser(
          with: UserInfo(
            email: userEmail,
            password: userPassword
          ),
          path: UserRouter.register.path
        )
        print("User registered successfully! \(registration)")
      } catch {
        print("Error", error)
      }
    }
  }
  
  @MainActor
  func login() async {
    Task {
      do {
        let login = try await UserService.loginUser(
          with: UserInfo(
            email: userEmail,
            password: userPassword
          ),
          path: UserRouter.login.path
        )
//
//        let caughtBugs = login.data.caughtBug.map {
//          UserItems(
//            caughtFish: [],
//            caughtBug: [$0.self],
//            caughtSeaCreature: []
//          )
//        }
//        caughtItems.append(contentsOf: caughtBugs)
//        
//        let caughtFish = login.data.caughtFish.map {
//          UserItems(
//            caughtFish: [$0.self],
//            caughtBug: [],
//            caughtSeaCreature: []
//          )
//        }
//        caughtItems.append(contentsOf: caughtFish)
//
//        let caughtSeaCreatures = login.data.caughtSeaCreature.map {
//          UserItems(
//            caughtFish: [],
//            caughtBug: [],
//            caughtSeaCreature: [$0.self]
//          )
//        }
//        caughtItems.append(contentsOf: caughtSeaCreatures)
        
        print("User logged in successfully! \(login)")
      } catch {
        print("Error", error)
      }
    }
  }
}
