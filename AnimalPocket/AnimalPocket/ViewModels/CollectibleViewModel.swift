//
//  CollectibleViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

final class CollectibleViewModel: ObservableObject {
  @Published var itemsArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  
  @Published var showCurrentItem = false
  @Published var showItemsOfTheMonth = false
  @Published var showAllItems = true
  
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @Published var showMissingItemsOnly = false
  
  @Published var isCollected = false
  
  @MainActor func loadItems() {
    Task {
      do {
        // bugs
        let bugResponse = try await CollectibleService.fetchCollectibles(path: CategoryRouter.bug.path)
        let bugs = bugResponse.map {
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            monthNorthern: $0.monthNorthern,
            monthSouthern: $0.monthSouthern,
            monthArrayNorthern: $0.monthArrayNorthern,
            monthArraySouthern: $0.monthArraySouthern,
            availableTime: $0.availableTime,
            availableTimeArray: $0.availableTimeArray,
            isAllDay: $0.isAllDay,
            isAllYear: $0.isAllYear,
            location: $0.location,
            rarity: $0.rarity,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
//            isCollected: isCollected
          )
        }
        self.itemsArray.append(contentsOf: bugs)
        
        // fish
        let fishResponse = try await CollectibleService.fetchCollectibles(path: CategoryRouter.fish.path)
        let fish = fishResponse.map {
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            monthNorthern: $0.monthNorthern,
            monthSouthern: $0.monthSouthern,
            monthArrayNorthern: $0.monthArrayNorthern,
            monthArraySouthern: $0.monthArraySouthern,
            availableTime: $0.availableTime,
            availableTimeArray: $0.availableTimeArray,
            isAllDay: $0.isAllDay,
            isAllYear: $0.isAllYear,
            location: $0.location,
            rarity: $0.rarity,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
//            isCollected: isCollected
          )
        }
        self.itemsArray.append(contentsOf: fish)
        
        // sea creatures
        let seaResponse = try await CollectibleService.fetchCollectibles(path: CategoryRouter.seaCreature.path)
        let sea = seaResponse.map{
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            monthNorthern: $0.monthNorthern,
            monthSouthern: $0.monthSouthern,
            monthArrayNorthern: $0.monthArrayNorthern,
            monthArraySouthern: $0.monthArraySouthern,
            availableTime: $0.availableTime,
            availableTimeArray: $0.availableTimeArray,
            isAllDay: $0.isAllDay,
            isAllYear: $0.isAllYear,
            location: $0.location,
            rarity: $0.rarity,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
//            isCollected: isCollected
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
      for month in item.monthArrayNorthern {
        if month == item.currentMonth {
          currentItems.append(item)
        }
      }
    }
    return currentItems
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in itemsArray {
      for time in item.availableTimeArray {
        if time == item.currentTime {
          for month in item.monthArrayNorthern {
            if month == item.currentMonth {
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
//extension CollectibleViewModel {
//  var missingItems: [CollectibleItem] {
//    itemsArray.filter { item in
//      (!showMissingItemsOnly || !item.isCollected)
//    }
//  }
//}
