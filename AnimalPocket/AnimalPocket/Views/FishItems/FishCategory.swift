//
//  FishCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct FishCategory: View {
  @ObservedObject var viewModel = FishViewModel()
  
  let columns = [
    GridItem(),
    GridItem()
  ]
  
  var body: some View {
    VStack {
      Text("Poissons")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.fishArray) { fish in
            FishDetails(fish: fish)
          }
        }
      }
      .onAppear(perform: {
        viewModel.loadFish()
      })
    }
  }
}


struct FishCategory_Previews: PreviewProvider {
  static var previews: some View {
    FishCategory()
  }
}
