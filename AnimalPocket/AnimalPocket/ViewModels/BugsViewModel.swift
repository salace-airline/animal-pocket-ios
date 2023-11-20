//
//  BugsViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

final class BugsViewModel: ObservableObject {
  @Published var bugsArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  
  @Published var showCurrentBugs = true
  @Published var showBugsOfTheMonth = true
  @Published var showAllBugs = true
  
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @Published var showMissingItemsOnly = false
      
  @MainActor func loadBugs() {
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
          )
        }
        self.bugsArray = bugs
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension BugsViewModel {
  var currentMonth: [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in bugsArray {
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
    for item in bugsArray {
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


