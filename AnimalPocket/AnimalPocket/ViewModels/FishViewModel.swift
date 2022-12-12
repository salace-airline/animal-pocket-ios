//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fishArray: [Fish] = []

  func getFish(fishID: Int) -> Fish? {
    return self.fishArray.first(where: {$0.id == fishID})
  }
  
  @MainActor func loadFish() {
    Task {
      do {
        let response = try await FishNetworkService.fetchFish()
        self.fishArray = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}
