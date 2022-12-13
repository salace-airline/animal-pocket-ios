//
//  BugRow.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugRow: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.bugsArray) { bug in
          BugDetails(bug: bug)
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
    BugRow(viewModel: BugsViewModel())
  }
}
