//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct GridView: View {
  @ObservedObject var viewModel = FishViewModel()
  
  // one row per category for the home page
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 15) {
        ForEach(viewModel.fish) { bug in
          GridItemDetails()
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
    GridView()
  }
}
