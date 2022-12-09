//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  @ObservedObject var viewModel = FishViewModel()
  var fish: Fish
  
  var body: some View {
    VStack {
      FishImage(fishImage: fish)

      VStack {
        Text(fish.name.nameEUfr)
          .font(.system(size: 20))
          .bold()
      }
      .padding(.bottom, 2)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période: ")
            .foregroundColor(Colors.green100)
            .bold()
          Text(fish.fishAvailability.time)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("Toute la journée")
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("Fleurs")
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("200")
          Text("clochettes")
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
                               fishAvailability: FishAvailability.init(monthNorthern: "11-3", monthSouthern: "5-9", time: "", isAllDay: true, isAllYear: false, location: "River", rarity: "Common", monthArrayNorthern: [11, 12, 1, 2, 3], monthArraySouthern: [5, 6, 7, 8, 9], timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                               shadow: "Smallest (1)",
                               price: 900,
                               imageURI: "https://acnhapi.com/v1/images/fish/1",
                               iconURI: "https://acnhapi.com/v1/icons/fish/1")
    static var previews: some View {
      FishDetails(fish: sampleFish)
    }
}
