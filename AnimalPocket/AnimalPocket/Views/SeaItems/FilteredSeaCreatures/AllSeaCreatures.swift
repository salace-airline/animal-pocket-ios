//
//  AllSeaCreatures.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllSeaCreatures: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.seaArray)
        case .increasingPrice:
          loadedSea(sea: viewModel.increasePrice(of: viewModel.seaArray))
        case .decreasingPrice:
          loadedSea(sea: viewModel.decreasePrice(of: viewModel.seaArray))
        case .alphatically:
          loadedSea(sea: viewModel.sortAlphabetically(viewModel.seaArray))
      }
    }
  }
  
  func loadedSea(sea: [SeaCreature]) -> some View {
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

struct AllSeaCreatures_Previews: PreviewProvider {
  static var previews: some View {
    AllSeaCreatures()
  }
}
