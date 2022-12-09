//
//  FishViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class FishViewModel: ObservableObject {
  @Published var fish: [Fish] = []
  
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
