//
//  BugsViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

final class BugsViewModel: ObservableObject {
  @Published var bugsArray: [Collectible] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @MainActor func loadBugs() {
    Task {
      do {
        let response = try await CollectibleService.fetchCollectibles(path: "bugs")
        self.bugsArray = response
      } catch {
        print("Error", error)
      }
    }
  }
}

extension BugsViewModel {
  // Month & current filters
  var currentMonth: [Collectible] {
    var currentItems: [Collectible] = []
    for item in bugsArray {
      for month in item.availability.monthArrayNorthern {
        if month == item.availability.currentMonth {
          currentItems.append(item)
        }
      }
    }
    return currentItems
  }
  
  var currentlyAvailable: [Collectible] {
    var currentItems: [Collectible] = []
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


