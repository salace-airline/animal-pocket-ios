//
//  SeaCreaturesOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct SeaCreaturesOfTheMonth: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.currentMonthSea)
        case .increasingPrice:
          loadedSea(sea: viewModel.filter.increasePrice(of: viewModel.currentMonthSea))
        case .decreasingPrice:
          loadedSea(sea: viewModel.filter.decreasePrice(of: viewModel.currentMonthSea))
        case .alphatically:
          loadedSea(sea: viewModel.filter.sortAlphabetically(viewModel.currentMonthSea))
      }
    }
  }
  
  func loadedSea(sea: [Collectible]) -> some View {
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

struct SeaCreaturesOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    SeaCreaturesOfTheMonth()
  }
}
