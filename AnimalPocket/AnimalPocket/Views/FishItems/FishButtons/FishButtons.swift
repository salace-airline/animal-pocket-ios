//
//  FishButtons.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct FishButtons: View {
  @ObservedObject var viewModel: FishViewModel
  
  var body: some View {
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
