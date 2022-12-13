//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaArray: [SeaCreature] = []
  
  func getSea(seaID: Int) -> SeaCreature? {
    return self.seaArray.first(where: {$0.id == seaID})
  }
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await SeaCreatureNetworkService.fetchSeaCreature()
        self.seaArray = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}
