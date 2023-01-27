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
      
      switch viewModel.filter {
        case .noFilter:
          loadedFish(fish: viewModel.fishArray)
        case .increasingPrice:
          loadedFish(fish: viewModel.increasePrice(of: viewModel.fishArray))
        case .decreasingPrice:
          loadedFish(fish: viewModel.decreasePrice(of: viewModel.fishArray))
        case .alphatically:
          loadedFish(fish: viewModel.sortAlphabetically(fish: viewModel.fishArray))
      }
      
      HStack {
        FishFilterButton(isSelected: $viewModel.alphabeticalOrder,
                     color: Colors.blue100,
                     buttonText: "Nom")
        .onTapGesture(perform: {
          viewModel.alphabeticalOrder.toggle()
          viewModel.filter = .alphatically
          viewModel.alphabeticalOrder = true
          
          if viewModel.alphabeticalOrder {
            viewModel.increasingPrice = false
            viewModel.decreasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        FishFilterButton(isSelected: $viewModel.decreasingPrice,
                     color: Colors.blue100,
                     buttonText: "Prix + -")
        .onTapGesture(perform: {
          viewModel.decreasingPrice.toggle()
          viewModel.filter = .decreasingPrice
          viewModel.decreasingPrice = true
          
          if viewModel.decreasingPrice {
            viewModel.alphabeticalOrder = false
            viewModel.increasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        FishFilterButton(isSelected: $viewModel.increasingPrice,
                     color: Colors.blue100,
                     buttonText: "Prix - +")
        .onTapGesture(perform: {
          viewModel.increasingPrice.toggle()
          viewModel.filter = .increasingPrice
          viewModel.increasingPrice = true
          
          if viewModel.increasingPrice {
            viewModel.alphabeticalOrder = false
            viewModel.decreasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        FishFilterButton(isSelected: $viewModel.noFilter,
                     color: Colors.blue100,
                     buttonText: "🧽")
        .onTapGesture(perform: {
          viewModel.noFilter.toggle()
          viewModel.filter = .noFilter
          viewModel.noFilter = true
          
          if viewModel.noFilter {
            viewModel.alphabeticalOrder = false
            viewModel.increasingPrice = false
            viewModel.decreasingPrice = false
          }
        })
      }
    }
  }

  func loadedFish(fish: [Fish]) -> some View {
    NavigationStack {
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

struct FishCategory_Previews: PreviewProvider {
  static var previews: some View {
    FishCategory()
  }
}
