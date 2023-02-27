//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fishArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false

  @MainActor func loadFish() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: "fish")
        let fish = response.map {
          CollectibleItem(id: $0.id,
                          name: $0.name,
                          availability: $0.availability,
                          speed: $0.speed,
                          shadow: $0.shadow,
                          price: $0.price,
                          iconURI: $0.iconURI)
        }
        self.fishArray = fish
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension FishViewModel {
  var currentMonthFish: [CollectibleItem] {
    var currentFish: [CollectibleItem] = []
    for fish in fishArray {
      for month in fish.availability.monthArrayNorthern {
        if month == fish.availability.currentMonth {
          currentFish.append(fish)
        }
      }
    }
    return currentFish
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentFish: [CollectibleItem] = []
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
