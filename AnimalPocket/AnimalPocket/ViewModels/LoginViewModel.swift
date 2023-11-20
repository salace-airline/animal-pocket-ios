//
//  LoginViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var isUserRegistered = false
  @Published var isUserLoggedIn = false
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  @Published var caughtItems: UserItems = UserItems(
    caughtFish: [],
    caughtBug: [],
    caughtSeaCreature: []
  )
  
  @MainActor
  func checkExistingUser() async -> Bool {
    do {
      let user = try await UserService.getUser(with: UserRouter.user.path)
      print("User exists")
      return true
    } catch {
      print("Error", error)
      return false
    }
  }
  
  @MainActor
  func register() async {
    if await checkExistingUser() {
      // send info that the user is already registered
      print("User is already registered")
    } else {
      Task {
        do {
          let registration = try await UserService.registerUser(
            with: UserInfo(
              email: userEmail,
              password: userPassword
            ),
            path: UserRouter.register.path
          )
//          isUserRegistered = true
          print("User registered successfully! \(registration)")
        } catch {
          print("Error", error)
        }
      }
    }
  }
  
  @MainActor
  func login() async {
    if await checkExistingUser() {
      Task {
        do {
          let login = try await UserService.loginUser(
            with: UserInfo(
              email: userEmail,
              password: userPassword
            ),
            path: UserRouter.login.path
          )
          
          isUserLoggedIn = true
          
          let caughtBugs = login.data.caughtBug
          let caughtFish = login.data.caughtFish
          let caughtSea = login.data.caughtSeaCreature
          
          let updatedUser = UserItems(caughtFish: caughtFish, caughtBug: caughtBugs, caughtSeaCreature: caughtSea)
          caughtItems = updatedUser
          
          login.data.caughtBug.map {
            UserItems(
              caughtFish: [],
              caughtBug: [$0.self],
              caughtSeaCreature: []
            )
          }
          
          login.data.caughtFish.map {
            UserItems(
              caughtFish: [$0.self],
              caughtBug: [],
              caughtSeaCreature: []
            )
          }
          
          login.data.caughtSeaCreature.map {
            UserItems(
              caughtFish: [],
              caughtBug: [],
              caughtSeaCreature: [$0.self]
            )
          }
          
          print("User logged in successfully! \(login)")
//          print(caughtItems.caughtBug)
//          print(caughtItems.caughtFish)
//          print(caughtItems.caughtSeaCreature)
        } catch {
          print("Error", error)
        }
      }
    }
  else {
      // send info that the user needs to register first
      print("User is not registered")
    }
  }
}

extension LoginViewModel {
  func containsFish(_ collectedItem: Int) -> Bool {
    caughtItems.caughtFish.contains(collectedItem)
  }
  
  func containsBug(_ collectedItem: Int) -> Bool {
    caughtItems.caughtBug.contains(collectedItem)
  }
  
  func containsSeaCreature(_ collectedItem: Int) -> Bool {
    caughtItems.caughtSeaCreature.contains(collectedItem)
  }
}
