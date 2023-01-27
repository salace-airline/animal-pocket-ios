//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fishArray: [Fish] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false

  @MainActor func loadFish() {
    Task {
      do {
        let response = try await FishNetworkService.fetchFish()
        self.fishArray = response
      } catch {
        print("Error", error)
      }
    }
  }
}

// Price filters
extension FishViewModel {
  func decreasePrice(of fish: [Fish]) -> [Fish] {
    fish.sorted(by: {
      $0.price > $1.price
    })
  }
  
  func increasePrice(of fish: [Fish]) -> [Fish] {
    fish.sorted(by: {
      $0.price < $1.price
    })
  }
}

// Alphabetical filter
extension FishViewModel {
  func sortAlphabetically(fish: [Fish]) -> [Fish] {
    fish.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr
    })
  }
}

// Month & current filters
extension FishViewModel {
  var currentMonthFish: [Fish] {
    var currentFish: [Fish] = []
    for fish in fishArray {
      for month in fish.availability.monthArrayNorthern {
        if month == fish.availability.currentMonth {
          currentFish.append(fish)
        }
      }
    }
    return currentFish
  }
  
  var currentlyAvailable: [Fish] {
    var currentFish: [Fish] = []
    for fish in fishArray {
      for time in fish.availability.timeArray {
        if time == fish.availability.currentTime {
          for month in fish.availability.monthArrayNorthern {
            if month == fish.availability.currentMonth {
              currentFish.append(fish)
            }
          }
        }
      }
    }
    return currentFish
  }
}
