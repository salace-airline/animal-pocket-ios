//
//  CollectibleViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

final class CollectibleViewModel: ObservableObject {
  @Published var itemsArray: [CollectibleItem] = []
  @Published var bugsArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  
  @Published var showCurrentItem = false
  @Published var showItemsOfTheMonth = false
  @Published var showAllItems = true
  
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @Published var showMissingItemsOnly = false
  
  @MainActor func loadItems() {
    Task {
      do {
        // bugs
        let bugResponse = try await CollectibleService.fetchCollectibles(path: "bugs")
        let bugs = bugResponse.map {
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            availability: $0.availability,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
          )
        }
        self.itemsArray.append(contentsOf: bugs)
        
        // fish
        let fishResponse = try await CollectibleService.fetchCollectibles(path: "fish")
        let fish = fishResponse.map {
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            availability: $0.availability,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
          )
        }
        self.itemsArray.append(contentsOf: fish)
        
        // sea creatures
        let seaResponse = try await CollectibleService.fetchCollectibles(path: "sea")
        let sea = seaResponse.map{
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            availability: $0.availability,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
          )
        }
        self.itemsArray.append(contentsOf: sea)
        
        print(itemsArray)
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension CollectibleViewModel {
  var currentMonth: [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in itemsArray {
      for month in item.availability.monthArrayNorthern {
        if month == item.availability.currentMonth {
          currentItems.append(item)
        }
      }
    }
    return currentItems
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in itemsArray {
      for time in item.availability.timeArray {
        if time == item.availability.currentTime {
          for month in item.availability.monthArrayNorthern {
            if month == item.availability.currentMonth {
              currentItems.append(item)
            }
          }
        }
      }
    }
    return currentItems
  }
}

// Collection filter
extension CollectibleViewModel {
  var missingItems: [CollectibleItem] {
    itemsArray.filter { item in
      (!showMissingItemsOnly || !item.isCollected)
    }
  }
}

//extension CollectibleViewModel {
//  var checkCategory: [CollectibleItem] {
//    for item in itemsArray {
//      if item.itemNumber >= 0 && item.itemNumber <= 79 {
//        bugsArray.append(item)
//      }
//    }
//  }
//}
