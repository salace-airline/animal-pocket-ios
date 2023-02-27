//
//  CurrentSeaCreatures.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct CurrentSeaCreatures: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.currentlyAvailable)
        case .increasingPrice:
          loadedSea(sea: viewModel.filter.increasePrice(of: viewModel.currentlyAvailable))
        case .decreasingPrice:
          loadedSea(sea: viewModel.filter.decreasePrice(of: viewModel.currentlyAvailable))
        case .alphatically:
          loadedSea(sea: viewModel.filter.sortAlphabetically(viewModel.currentlyAvailable))
      }
    }
  }
  
  func loadedSea(sea: [CollectibleItem]) -> some View {
    NavigationStack {
      SeaButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(sea) { sea in
            SeaDetails(sea: sea)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreature()
    })
  }
}

struct CurrentSeaCreatures_Previews: PreviewProvider {
  static var previews: some View {
    CurrentSeaCreatures()
  }
}
