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
    NavigationStack {
      Text("Créatures Marines")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      HStack {
        Button(action: {
          viewModel.filter = .alphatically
          viewModel.alphabeticalOrder = true
        }, label: {
          Text("Nom")
        })
        
        Button(action: {
          viewModel.filter = .increasingPrice
          viewModel.increasingPrice = true
        }, label: {
          Text("Prix + -")
        })
        
        Button(action: {
          viewModel.filter = .decreasingPrice
          viewModel.decreasingPrice = true
        }, label: {
          Text("Prix - +")
        })
        
        Button(action: {
          viewModel.filter = .noFilter
        }, label: {
          Image(systemName: "eraser")
        })
      }
      .buttonStyle(.bordered)
      
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.seaArray)
        case .increasingPrice:
          loadedSea(sea: viewModel.sortedIncreasingPrice)
        case .decreasingPrice:
          loadedSea(sea: viewModel.sortedDecreasingPrice)
        case .alphatically:
          loadedSea(sea: viewModel.sortedAlphabetically)
      }
    }
  }
    
  func loadedSea(sea: [SeaCreature]) -> some View {
    NavigationStack {
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
          ForEach(sea) { sea in
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
