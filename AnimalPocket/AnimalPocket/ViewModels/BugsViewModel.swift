//
//  BugsViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

final class BugsViewModel: ObservableObject {
  @Published var bugs: [Bug] = []
  
  @MainActor func loadBugs() {
    Task {
      do {
        let response = try await BugsNetworkService.fetchBugs()
        self.bugs = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}

