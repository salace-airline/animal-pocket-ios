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

extension FishViewModel {
  var sortedDecreasingPrice: [Fish] {
    fishArray.sorted(by: {
      $0.price > $1.price
    })
  }
  
  var sortedIncreasingPrice: [Fish] {
    fishArray.sorted(by: {
      $0.price < $1.price
    })
  }
  
  var sortedAlphabetically: [Fish] {
    fishArray.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr
    })
  }
}
