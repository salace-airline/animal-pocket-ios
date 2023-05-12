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
    for item in bugsArray {
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
extension BugsViewModel {
  var missingItems: [CollectibleItem] {
    bugsArray.filter { bug in
      (!showMissingItemsOnly || !bug.isCollected)
    }
  }
}


