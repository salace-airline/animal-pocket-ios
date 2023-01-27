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
      
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.seaArray)
        case .increasingPrice:
          loadedSea(sea: viewModel.increasePrice(of: viewModel.seaArray))
        case .decreasingPrice:
          loadedSea(sea: viewModel.decreasePrice(of: viewModel.seaArray))
        case .alphatically:
          loadedSea(sea: viewModel.sortAlphabetically(viewModel.seaArray))
      }
      
      HStack {
        SeaFilterButton(isSelected: $viewModel.alphabeticalOrder,
                         color: Colors.blueDark,
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
        
        SeaFilterButton(isSelected: $viewModel.decreasingPrice,
                         color: Colors.blueDark,
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
        
        SeaFilterButton(isSelected: $viewModel.increasingPrice,
                         color: Colors.blueDark,
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
        
        SeaFilterButton(isSelected: $viewModel.noFilter,
                         color: Colors.blueDark,
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
