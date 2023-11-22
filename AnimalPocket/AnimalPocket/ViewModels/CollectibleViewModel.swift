//
//  CollectibleViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

final class CollectibleViewModel: ObservableObject {
  @Published var bugsArray: [CollectibleItem] = []
  @Published var fishArray: [CollectibleItem] = []
  @Published var seaArray: [CollectibleItem] = []
  
  @Published var filter: Filter = .noFilter
  
  @Published var showCurrentItem = false
  @Published var showItemsOfTheMonth = false
  @Published var showAllItems = true
  
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @Published var showMissingBugs = false
  
  // bugs
  @MainActor func loadBugs() {
    Task {
      do {
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
          )
        }
        self.bugsArray.append(contentsOf: bugs)
      } catch {
        print("Error", error)
      }
    }
  }
        
  // fish
  @MainActor func loadFish() {
    Task {
      do {
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
          )
        }
        self.fishArray.append(contentsOf: fish)
      } catch {
        print("Error", error)
      }
    }
  }
        
    // sea creatures
    @MainActor func loadSeaCreatures() {
      Task {
        do {
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
          )
        }
        self.seaArray.append(contentsOf: sea)
      } catch {
        print("Error", error)
      }
    }
  }
}

/// MARK -  Month & currently available filters
extension CollectibleViewModel {
  func filterCurrentMonth(for items: [CollectibleItem]) -> [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in items {
      for month in item.monthArrayNorthern {
        if month == item.currentMonth {
          currentItems.append(item)
        }
      }
    }
    return currentItems
  }

  func filterCurrentItems(for items: [CollectibleItem]) -> [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in items {
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
