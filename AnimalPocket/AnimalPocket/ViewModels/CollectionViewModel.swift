//
//  CollectionViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

class CollectionViewModel: ObservableObject {
  @Published var collectedItems: UserItems
  
  init(collectedItems: UserItems) {
    self.collectedItems = collectedItems
  }
  
  @MainActor
  func updateCollection(with fish: Int, bug: Int, sea: Int) async {
    Task {
      do {
        let update = try await UserService.updateUserCollection(with: collectedItems, path: UserRouter.update.path)
        print("Collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }
}
