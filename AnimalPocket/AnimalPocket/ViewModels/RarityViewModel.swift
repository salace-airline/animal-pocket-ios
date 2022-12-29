//
//  RarityViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 29/12/2022.
//

import Foundation

final class RarityViewModel: ObservableObject {
  @Published var rarityLevel: Rarity
  
  init(rarityLevel: Rarity) {
    self.rarityLevel = rarityLevel
  }
}
