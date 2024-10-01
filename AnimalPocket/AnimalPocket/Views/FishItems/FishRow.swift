//
//  FishRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishRow: View {
  @ObservedObject var viewModel = CollectibleViewModel(category: .fish)
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.filterCurrentItems(for: viewModel.fishArray)) { fish in
          FishDetails(fish: fish)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadItems()
    })
  }
}
