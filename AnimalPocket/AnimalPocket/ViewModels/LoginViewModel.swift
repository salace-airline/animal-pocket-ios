//
//  LoginViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var isUserLoggedIn = false
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  @Published var caughtItems: UserItems = UserItems(
    caughtFish: [],
    caughtBug: [],
    caughtSeaCreature: []
  )
  
  @Published var showMissingItemsOnly = false
  
  //  @MainActor
  //  func checkExistingUser() async -> Bool {
  //    do {
  //      let user = try await UserService.getUser(with: UserRouter.user.path)
  //      print("User exists")
  //      return true
  //    } catch {
  //      print("Error", error)
  //      return false
  //    }
  //  }
  
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
        print(caughtItems.caughtBug)
        print(caughtItems.caughtFish)
        print(caughtItems.caughtSeaCreature)
      } catch {
        print("Error", error)
      }
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

/// MARK - Handle showing missing items only
extension LoginViewModel {
  func showMissingFish(_ collectedFish: [CollectibleItem]) -> [CollectibleItem] {
    var missingFish = [CollectibleItem]()
    for fish in collectedFish{
      if caughtItems.caughtFish.contains(fish.itemNumber) == false {
        missingFish.append(fish)
        print(fish.itemNumber)
      }
    }
    return missingFish
  }
  
  func showMissingBugs(_ collectedBugs: [CollectibleItem]) -> [CollectibleItem] {
    var missingBugs = [CollectibleItem]()
    for bug in collectedBugs {
      if caughtItems.caughtBug.contains(bug.itemNumber) == false {
        missingBugs.append(bug)
        print(bug.itemNumber)
      }
    }
    return missingBugs
  }
  
  func showMissingSeaCreatures(_ collectedSeaCreatures: [CollectibleItem]) -> [CollectibleItem] {
    var missingSeaCreatures = [CollectibleItem]()
    for seaCreature in collectedSeaCreatures {
      if caughtItems.caughtSeaCreature.contains(seaCreature.itemNumber) == false {
        missingSeaCreatures.append(seaCreature)
        print(seaCreature.itemNumber)
      }
    }
    return missingSeaCreatures
  }
}
