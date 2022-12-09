//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishGrid: View {
  @ObservedObject var viewModel = FishViewModel()
  
  // one row per category for the home page
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 15) {
        ForEach(viewModel.fish) { fish in
//          FishDetails()
          Text("Coucou")
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    FishGrid()
  }
}
