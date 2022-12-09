//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaCreature: [SeaCreature] = []
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await SeaCreatureNetworkService.fetchSeaCreature()
        self.seaCreature = response
        print(response)
      } catch {
        print("Error", error)
      }
    }
  }
}
