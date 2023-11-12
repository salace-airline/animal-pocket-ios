//
//  CollectionViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

final class CollectionViewModel: ObservableObject {
  @Published var collectedItems = UserItems(
    caughtFish: [],
    caughtBug: [],
    caughtSeaCreature: []
  )
  
  @MainActor
  func updateCollection(with collectedItems: UserItems) async {
    Task {
      do {
        let update = try await UserService.updateUserCollection(with: collectedItems, path: UserRouter.update.path)
        self.collectedItems = update
        print("Collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }
}

extension CollectionViewModel {
  func addCollectedBug(with id: Int) {
    collectedItems.caughtBug.append(id)
  }
  
  func addCollectedFish(with id: Int) {
    collectedItems.caughtFish.append(id)
  }
  
  func addCollectedSeaCreature(with id: Int) {
    collectedItems.caughtSeaCreature.append(id)
  }
}
