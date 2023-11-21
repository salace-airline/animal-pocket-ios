//
//  SeaRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaRow: View {
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.filterCurrentItems(for: viewModel.seaArray)) { sea in
          SeaDetails(sea: sea)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreatures()
    })
  }
}

struct SeaRow_Previews: PreviewProvider {
  static var previews: some View {
    SeaRow(viewModel: CollectibleViewModel()
    )
  }
}
