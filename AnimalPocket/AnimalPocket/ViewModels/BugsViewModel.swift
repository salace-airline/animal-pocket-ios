//
//  BugsViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation

final class BugsViewModel: ObservableObject {
  @Published var bugsArray: [Bug] = []
  
  func getBug(bugID: Int) -> Bug? {
    return self.bugsArray.first(where: {$0.id == bugID})
  }
  
  @MainActor func loadBugs() {
    Task {
      do {
        let response = try await BugsNetworkService.fetchBugs()
        self.bugsArray = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}

