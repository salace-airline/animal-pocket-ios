//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  @ObservedObject var viewModel: FishViewModel
  
  var body: some View {
    VStack {
      FishImage(viewModel: FishViewModel(sampleFish: viewModel.sampleFish))

      VStack {
        Text(viewModel.sampleFish.name.nameEUfr)
          .font(.system(size: 20))
          .bold()
      }
      .padding(.bottom, 2)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(viewModel.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(viewModel.hour)
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(viewModel.sampleFish.availability.location)
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(viewModel.sampleFish.price) clochettes")
        }
      }
      .font(.system(size: 15))
      .padding(.bottom, 5)
    }
    .frame(width: 175)
    .background(Colors.beige100)
  }
}

struct GridItem_Previews: PreviewProvider {
  static var sampleFish = Fish(id: 1,
                               name: Name(nameEUen: "bitterling", nameEUfr: "bouvière"),
                               availability: Availability.init(monthNorthern: "11-3", monthSouthern: "5-9", time: Time.empty, isAllDay: true, isAllYear: false, location: "River", rarity: "Common", monthArrayNorthern: [11, 12, 1, 2, 3], monthArraySouthern: [5, 6, 7, 8, 9], timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                               shadow: "Smallest (1)",
                               price: 900,
                               imageURI: "https://acnhapi.com/v1/images/fish/1",
                               iconURI: "https://acnhapi.com/v1/icons/fish/1")
    static var previews: some View {
      FishDetails(viewModel: FishViewModel(sampleFish: sampleFish))
    }
}
