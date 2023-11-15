//
//  CollectionViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

final class CollectionViewModel: ObservableObject {
//  @Published var collectedItems = UserItems(
//    caughtFish: [],
//    caughtBug: [],
//    caughtSeaCreature: []
//  )
  
  private var collectedItems: Set<UUID>
  
  private let saveKey = "CollectedItems"
  
  init() {
    if let data = UserDefaults.standard.data(forKey: saveKey) {
      if let decoded = try? JSONDecoder().decode(Set<UUID>.self, from: data) {
        self.collectedItems = decoded
        return
      }
    }
    collectedItems = []
  }
  
  func contains(_ collectedItem: CollectibleItem) -> Bool {
    collectedItems.contains(collectedItem.id)
  }
  
  func add(_ collectedItem: CollectibleItem) {
    objectWillChange.send()
    collectedItems.insert(collectedItem.id)
    save()
  }
  
  func remove(_ collectedItem: CollectibleItem) {
    objectWillChange.send()
    collectedItems.remove(collectedItem.id)
    save()
  }
  
  func save() {
    if let encoded = try? JSONEncoder().encode(collectedItems) {
      UserDefaults.standard.set(encoded, forKey: saveKey)
    }
  }
  
//  @MainActor
//  func updateCollection(with collectedItems: UserItems) async {
//    Task {
//      do {
//        let update = try await UserService.updateUserCollection(with: collectedItems, path: UserRouter.update.path)
//        self.collectedItems = update
//        print("Collection updated successfully! \(update)")
//      } catch {
//        print("Error", error)
//      }
//    }
//  }
}

//extension CollectionViewModel {
//  func addCollectedBug(with id: Int) {
//    collectedItems.caughtBug.append(id)
//  }
//
//  func addCollectedFish(with id: Int) {
//    collectedItems.caughtFish.append(id)
//  }
//
//  func addCollectedSeaCreature(with id: Int) {
//    collectedItems.caughtSeaCreature.append(id)
//  }
//}
