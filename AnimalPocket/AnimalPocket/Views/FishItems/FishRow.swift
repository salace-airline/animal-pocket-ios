//
//  FishRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishRow: View {
  @ObservedObject var viewModel = FishViewModel()
  @ObservedObject var collectionViewModel = CollectionViewModel()
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.currentlyAvailable) { fish in
          FishDetails(viewModel: collectionViewModel, fish: fish)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
}

struct FishRow_Previews: PreviewProvider {
  static var previews: some View {
    FishRow(viewModel: FishViewModel())
  }
}
