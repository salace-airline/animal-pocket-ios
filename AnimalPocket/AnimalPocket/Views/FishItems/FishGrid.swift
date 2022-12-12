//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishGrid: View {
  @ObservedObject var viewModel: FishViewModel
  
  // one row per category for the home page
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 15) {
        ForEach(viewModel.fish) { fish in
          FishDetails(viewModel: viewModel)
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
}

struct GridView_Previews: PreviewProvider {
  static var sampleFish = Fish(id: 1,
                               name: Name(nameEUen: "bitterling", nameEUfr: "bouvière"),
                               availability: Availability.init(monthNorthern: "11-3", monthSouthern: "5-9", time: Time.empty, isAllDay: true, isAllYear: false, location: "River", rarity: "Common", monthArrayNorthern: [11, 12, 1, 2, 3], monthArraySouthern: [5, 6, 7, 8, 9], timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                               shadow: "Smallest (1)",
                               price: 900,
                               imageURI: "https://acnhapi.com/v1/images/fish/1",
                               iconURI: "https://acnhapi.com/v1/icons/fish/1")
  static var previews: some View {
    FishGrid(viewModel: FishViewModel(sampleFish: sampleFish))
  }
}
