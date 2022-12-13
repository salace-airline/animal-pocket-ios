//
//  SeaRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaRow: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.seaArray) { sea in
          SeaDetails(sea: sea)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreature()
    })
  }
}

struct SeaRow_Previews: PreviewProvider {
  static var previews: some View {
    SeaRow(viewModel: SeaCreatureViewModel())
  }
}
