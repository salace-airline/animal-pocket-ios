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
  @Published var caughtItems: UserItems = UserItems(
    caughtFish: [],
    caughtBug: [],
    caughtSeaCreature: []
  )
  
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
        
        let caughtBugs = login.data.caughtBug
        let caughtFish = login.data.caughtFish
        let caughtSea = login.data.caughtSeaCreature
        
        let updatedUser = UserItems(caughtFish: caughtFish, caughtBug: caughtBugs, caughtSeaCreature: caughtSea)
        caughtItems = updatedUser
        
        let mapCaughtBugs = login.data.caughtBug.map {
          UserItems(
            caughtFish: [],
            caughtBug: [$0.self],
            caughtSeaCreature: []
          )
        }
        
        let mapCaughtFish = login.data.caughtFish.map {
          UserItems(
            caughtFish: [$0.self],
            caughtBug: [],
            caughtSeaCreature: []
          )
        }
        
        let mapCaughtSea = login.data.caughtSeaCreature.map {
          UserItems(
            caughtFish: [],
            caughtBug: [],
            caughtSeaCreature: [$0.self]
          )
        }
        
        print("User logged in successfully! \(login)")
//        print(caughtBugs)
//        print(caughtFish)
//        print(caughtSea)
      } catch {
        print("Error", error)
      }
    }
  }
}
