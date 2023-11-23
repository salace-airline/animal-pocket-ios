//
//  SeaButtons.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct SeaButtons: View {
  @ObservedObject var viewModel: CollectibleViewModel
  
  var body: some View {
    HStack {
      SeaFilterButton(isSelected: $viewModel.alphabeticalOrder,
                      color: Colors.blueDark,
                      buttonText: "Name")
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
                      buttonText: "Price + -")
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
                      buttonText: "Price - +")
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
