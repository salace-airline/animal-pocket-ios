//
//  FishCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct FishCategory: View {
  @ObservedObject var viewModel = FishViewModel()
  
  var body: some View {
    VStack {
      Text("Fish")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $viewModel.showCurrentFish, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showCurrentFish {
            CurrentFish()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showFishOfTheMonth, label: {
            Text("This Month")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showFishOfTheMonth {
            FishOfTheMonth()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showAllFish, label: {
            Text("All Fish")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showAllFish {
            AllFish()
          }
        }
      }
      Image("tide3")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct FishCategory_Previews: PreviewProvider {
  static var previews: some View {
    FishCategory()
  }
}
