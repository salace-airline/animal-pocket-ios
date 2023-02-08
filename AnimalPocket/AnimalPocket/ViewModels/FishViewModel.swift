//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fishArray: [Collectible] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false

  @MainActor func loadFish() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: "fish")
        self.fishArray = response
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension FishViewModel {
  var currentMonthFish: [Collectible] {
    var currentFish: [Collectible] = []
    for fish in fishArray {
      for month in fish.availability.monthArrayNorthern {
        if month == fish.availability.currentMonth {
          currentFish.append(fish)
        }
      }
    }
    return currentFish
  }
  
  var currentlyAvailable: [Collectible] {
    var currentFish: [Collectible] = []
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
