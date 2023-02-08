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

// Price filters
extension BugsViewModel {
  func decreasePrice(of bugs: [Collectible]) -> [Collectible] {
    bugs.sorted(by: {
      $0.price > $1.price
    })
  }
 
  func increasePrice(of bugs: [Collectible]) -> [Collectible] {
    bugs.sorted(by: {
      $0.price < $1.price
    })
  }
}

// Alphabetical filter
extension BugsViewModel {
  func sortAlphabetically(_ bugs: [Collectible]) -> [Collectible] {
     bugs.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr
    })
  }
}

// Month & current filters
extension BugsViewModel {
  var currentMonthBugs: [Collectible] {
    var currentBugs: [Collectible] = []
    for bug in bugsArray {
      for month in bug.availability.monthArrayNorthern {
        if month == bug.availability.currentMonth {
          currentBugs.append(bug)
        }
      }
    }
    return currentBugs
  }

  var currentlyAvailable: [Collectible] {
    var currentBugs: [Collectible] = []
    for bug in bugsArray {
      for time in bug.availability.timeArray {
        if time == bug.availability.currentTime {
          for month in bug.availability.monthArrayNorthern {
            if month == bug.availability.currentMonth {
              currentBugs.append(bug)
            }
          }
        }
      }
    }
    return currentBugs
  }
}

