//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: "sea")
        let sea = response.map {
          CollectibleItem(id: $0.id,
                          name: $0.name,
                          availability: $0.availability,
                          speed: $0.speed,
                          shadow: $0.shadow,
                          price: $0.price,
                          iconURI: $0.iconURI)
        }
        self.seaArray = sea
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension SeaCreatureViewModel {  
  var currentMonthSea: [CollectibleItem] {
    var currentSea: [CollectibleItem] = []
    for sea in seaArray {
      for month in sea.availability.monthArrayNorthern {
        if month == sea.availability.currentMonth {
          currentSea.append(sea)
        }
      }
    }
    return currentSea
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentSea: [CollectibleItem] = []
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
