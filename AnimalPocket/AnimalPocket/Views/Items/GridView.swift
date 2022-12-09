//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct GridView: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  // one row per category for the home page
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 15) {
        ForEach(viewModel.seaCreature) { seaCreature in
          GridItemDetails()
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreature()
    })
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView()
  }
}
