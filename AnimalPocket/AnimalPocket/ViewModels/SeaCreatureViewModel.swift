//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaArray: [SeaCreature] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await SeaCreatureNetworkService.fetchSeaCreature()
        self.seaArray = response
      } catch {
        print("Error", error)
      }
    }
  }
}

// Price filters
extension SeaCreatureViewModel {
  func decreasePrice(of sea: [SeaCreature]) -> [SeaCreature] {
    sea.sorted(by: {
      $0.price > $1.price
    })
  }
  
  func increasePrice(of sea: [SeaCreature]) -> [SeaCreature] {
    sea.sorted(by: {
      $0.price < $1.price
    })
  }
}

// Alphabetical filter
extension SeaCreatureViewModel {
  func sortAlphabetically(_ sea: [SeaCreature]) -> [SeaCreature] {
    sea.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr
    })
  }
}

// Month & current filters
extension SeaCreatureViewModel {
  var currentMonthSea: [SeaCreature] {
    var currentSea: [SeaCreature] = []
    for sea in seaArray {
      for month in sea.seaCreatureAvailability.monthArrayNorthern {
        if month == sea.seaCreatureAvailability.currentMonth {
          currentSea.append(sea)
        }
      }
    }
    return currentSea
  }
  
  var currentlyAvailable: [SeaCreature] {
    var currentSea: [SeaCreature] = []
    for sea in seaArray {
      for time in sea.seaCreatureAvailability.timeArray {
        if time == sea.seaCreatureAvailability.currentTime {
          for month in sea.seaCreatureAvailability.monthArrayNorthern {
            if month == sea.seaCreatureAvailability.currentMonth {
              currentSea.append(sea)
            }
          }
        }
      }
    }
    return currentSea
  }
}
