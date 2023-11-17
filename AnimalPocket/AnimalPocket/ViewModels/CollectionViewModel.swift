//
//  CollectionViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 09/11/2023.
//

import Foundation

final class CollectionViewModel: ObservableObject {
  private var collectedItems: Set<String>
  
  private let saveKey = "CollectedItems"
  
  init() {
    if let data = UserDefaults.standard.data(forKey: saveKey) {
      if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
        self.collectedItems = decoded
        return
      }
    }
    collectedItems = []
  }
  
  func contains(_ collectedItem: CollectibleItem) -> Bool {
    collectedItems.contains(collectedItem.name)
  }
  
  func add(_ collectedItem: CollectibleItem) {
    objectWillChange.send()
    collectedItems.insert(collectedItem.name)
    save()
  }
  
  func remove(_ collectedItem: CollectibleItem) {
    objectWillChange.send()
    collectedItems.remove(collectedItem.name)
    save()
  }
  
  func emptyCollection() {
    objectWillChange.send()
    collectedItems.removeAll()
    save()
  }
  
  func save() {
    if let encoded = try? JSONEncoder().encode(collectedItems) {
      UserDefaults.standard.set(encoded, forKey: saveKey)
    }
  }
  
  @MainActor
  func updateFishCollection(with collectedFish: Int) async {
    Task {
      do {
        let update = try await UserService.updateUserCollection(with: collectedFish, path: UserRouter.updateFish.path)
        print("Fish collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }
  
  @MainActor
  func updateSeaCollection(with collectedSeaCreature: Int) async {
    Task {
      do {
        let update = try await UserService.updateUserCollection(with: collectedSeaCreature, path: UserRouter.updateSea.path)
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
        let update = try await UserService.updateUserCollection(with: collectedBug, path: UserRouter.updateBug.path)
        print("Bug collection updated successfully! \(update)")
      } catch {
        print("Error", error)
      }
    }
  }
}
