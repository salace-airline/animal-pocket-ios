//
//  FishCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct FishCategory: View {
  @ObservedObject var viewModel = FishViewModel()
  @State private var showCurrentFish = true
  @State private var showFishOfTheMonth = true
  @State private var showAllFish = true
  
  var body: some View {
    VStack {
      Text("Fish")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $showCurrentFish, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showCurrentFish {
            CurrentFish()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showFishOfTheMonth, label: {
            Text("This Month")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showFishOfTheMonth {
            FishOfTheMonth()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showAllFish, label: {
            Text("All Fish")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showAllFish {
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
