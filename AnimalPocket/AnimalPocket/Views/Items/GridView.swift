//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct GridView: View {
  @ObservedObject var viewModel = BugsViewModel()
  // we will iterate through the items in our API list
  let items = 1...10
  
  // one row per category for the home page
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 15) {
        ForEach(viewModel.bugs) { bug in
          GridItemDetails()
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView()
  }
}
