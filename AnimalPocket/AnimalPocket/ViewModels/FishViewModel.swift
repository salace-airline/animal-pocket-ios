//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fish: [Fish] = []
  let sampleFish: Fish
  
  init(sampleFish: Fish) {
    self.sampleFish = sampleFish
  }
  
  var period: String {
    if sampleFish.availability.time.self == .empty || sampleFish.availability.isAllYear == true {
      return "Toute l'année"
    } else {
      return sampleFish.availability.time.self.rawValue
    }
  }
  
  var hour: String {
    if sampleFish.availability.time.self == .empty || sampleFish.availability.isAllDay == true {
      return "Toute la journée"
    } else {
      return sampleFish.availability.time.self.rawValue
    }
  }
  
  @MainActor func loadFish() {
    Task {
      do {
        let response = try await FishNetworkService.fetchFish()
        self.fish = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}
