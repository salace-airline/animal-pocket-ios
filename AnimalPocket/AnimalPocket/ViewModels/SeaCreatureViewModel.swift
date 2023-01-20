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

extension SeaCreatureViewModel {
  var sortedDecreasingPrice: [SeaCreature] {
    seaArray.sorted(by: {
      $0.price > $1.price
    })
  }
  
  var sortedIncreasingPrice: [SeaCreature] {
    seaArray.sorted(by: {
      $0.price < $1.price
    })
  }
  
  var sortedAlphabetically: [SeaCreature] {
    seaArray.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr 
    })
  }
}
