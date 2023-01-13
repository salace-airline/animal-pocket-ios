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
    NavigationStack {
      Text("Poissons")
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
          loadedFish(fish: viewModel.fishArray)
        case .increasingPrice:
          loadedFish(fish: viewModel.sortedIncreasingPrice)
        case .decreasingPrice:
          loadedFish(fish: viewModel.sortedDecreasingPrice)
        case .alphatically:
          loadedFish(fish: viewModel.sortedAlphabetically)
      }
    }
  }
  
  
  func loadedFish(fish: [Fish]) -> some View {
    NavigationStack {
      VStack {
        ScrollView(.vertical) {
          LazyVGrid(columns: columns) {
            ForEach(fish) { fish in
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
}



struct FishCategory_Previews: PreviewProvider {
  static var previews: some View {
    FishCategory()
  }
}
