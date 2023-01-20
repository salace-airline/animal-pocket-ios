//
//  BugsViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

final class BugsViewModel: ObservableObject {
  @Published var bugsArray: [Bug] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @MainActor func loadBugs() {
    Task {
      do {
        let response = try await BugsNetworkService.fetchBugs()
        self.bugsArray = response
      } catch {
        print("Error", error)
      }
    }
  }
}

extension BugsViewModel {
  var sortedDecreasingPrice: [Bug] {
    bugsArray.sorted(by: {
      $0.price > $1.price
    })
  }
 
  var sortedIncreasingPrice: [Bug] {
    bugsArray.sorted(by: {
      $0.price < $1.price
    })
  }
  
  var sortedAlphabetically: [Bug] {
    bugsArray.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr 
    })
  }
  
  var itemSortedAlphabetically: [Bug] {
    bugsArray.sorted(by: {
      $0.name.nameEUfr < $1.name.nameEUfr
    })
  }
}

