//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaArray: [Collectible] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: "sea")
        self.seaArray = response
        print(response[39])
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension SeaCreatureViewModel {
  var currentMonthSea: [Collectible] {
    var currentSea: [Collectible] = []
    for sea in seaArray {
      for month in sea.availability.monthArrayNorthern {
        if month == sea.availability.currentMonth {
          currentSea.append(sea)
        }
      }
    }
    return currentSea
  }
  
  var currentlyAvailable: [Collectible] {
    var currentSea: [Collectible] = []
    for sea in seaArray {
      for time in sea.availability.timeArray {
        if time == sea.availability.currentTime {
          for month in sea.availability.monthArrayNorthern {
            if month == sea.availability.currentMonth {
              currentSea.append(sea)
            }
          }
        }
      }
    }
    return currentSea
  }
}
