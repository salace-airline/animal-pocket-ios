//
//  BugRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugRow: View {
  @ObservedObject var viewModel = BugsViewModel()
  @ObservedObject var collectionViewModel: CollectionViewModel
//  @EnvironmentObject var collection: CollectionViewModel
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.currentlyAvailable) { bug in
          BugDetails(viewModel: collectionViewModel, bug: bug)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
  }
}

struct BugRow_Previews: PreviewProvider {
  static var previews: some View {
    BugRow(collectionViewModel: CollectionViewModel())
  }
}
