//
//  SeaCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct SeaCategory: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  
  let columns = [
    GridItem(),
    GridItem()
  ]
  
  var body: some View {
    VStack {
      Text("Créatures Marines")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
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
}

struct SeaCategory_Previews: PreviewProvider {
    static var previews: some View {
        SeaCategory()
    }
}
