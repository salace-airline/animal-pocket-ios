//
//  UserViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

class UserViewModel: ObservableObject {
  @Published var isUserLoggedIn = false
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  @Published var caughtItems: UserItems = UserItems(
    caughtFish: [],
    caughtBug: [],
    caughtSeaCreature: []
  )
  
  @Published var showMissingBugs = false
  @Published var showMissingFish = false
  @Published var showMissingSeaCreatures = false
  
  @Published var filter: Filter = .noFilter
  
  @Published var selectedTab = 4
  
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
        selectedTab = 0
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
        
        selectedTab = 0
        print("User logged in successfully!")
        print("Caught bugs: \(caughtItems.caughtBug)")
        print("Cuaght fish: \(caughtItems.caughtFish)")
        print("Caught sea creatures: \(caughtItems.caughtSeaCreature)")
      } catch {
        print("Error", error)
      }
    }
  }
}

extension UserViewModel {
  @MainActor
  func updateFishCollection(with collectedFish: Int) async {
    Task {
      do {
        let update = try await UserService.updateFishCollection(with: UpdateFish(caughtFish: collectedFish), path: UserRouter.updateFish.path)
        caughtItems.caughtFish.append(collectedFish)
        print("Updated fish collection \(caughtItems.caughtFish)")
        print("Fish collection updated successfully! \(update) Fish number \(collectedFish)")
      } catch {
        print("Error", error)
      }
    }
  }
  
  @MainActor
  func updateSeaCollection(with collectedSeaCreature: Int) async {
    Task {
      do {
        let update = try await UserService.updateSeaCollection(with: UpdateSeaCreature(caughtSeaCreature: collectedSeaCreature), path: UserRouter.updateSea.path)
        caughtItems.caughtSeaCreature.append(collectedSeaCreature)
        print("Sea Creature collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }

  @MainActor
  func updateBugCollection(with collectedBug: Int) async {
    Task {
      do {
        let update = try await UserService.updateBugCollection(with: UpdateBug(caughtBug: collectedBug), path: UserRouter.updateBug.path)
        caughtItems.caughtBug.append(collectedBug)
        print("Updated bug \(caughtItems.caughtBug)")
        print("Bug collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }
}

extension UserViewModel {
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
extension UserViewModel {
  func showMissingFish(_ collectedFish: [CollectibleItem]) -> [CollectibleItem] {
    var missingFish = [CollectibleItem]()
    for fish in collectedFish{
      if caughtItems.caughtFish.contains(fish.itemNumber) == false {
        missingFish.append(fish)
      }
    }
    return missingFish
  }
  
  func showMissingBugs(_ collectedBugs: [CollectibleItem]) -> [CollectibleItem] {
    var missingBugs = [CollectibleItem]()
    for bug in collectedBugs {
      if caughtItems.caughtBug.contains(bug.itemNumber) == false {
        missingBugs.append(bug)
      }
    }
    return missingBugs
  }
  
  func showMissingSeaCreatures(_ collectedSeaCreatures: [CollectibleItem]) -> [CollectibleItem] {
    var missingSeaCreatures = [CollectibleItem]()
    for seaCreature in collectedSeaCreatures {
      if caughtItems.caughtSeaCreature.contains(seaCreature.itemNumber) == false {
        missingSeaCreatures.append(seaCreature)
      }
    }
    return missingSeaCreatures
  }
}
