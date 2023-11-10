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
  @Published var isCollected = false

  @MainActor func loadFish() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: CategoryRouter.fish.path)
        let fish = response.map {
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
      for month in fish.monthArrayNorthern {
        if month == fish.currentMonth {
          currentFish.append(fish)
        }
      }
    }
    return currentFish
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentFish: [CollectibleItem] = []
    for fish in fishArray {
      for time in fish.availableTimeArray {
        if time == fish.currentTime {
          for month in fish.monthArrayNorthern {
            if month == fish.currentMonth {
              currentFish.append(fish)
            }
          }
        }
      }
    }
    return currentFish
  }
}
