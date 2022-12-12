//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  var fish: Fish
  
  var body: some View {
    VStack {
      FishImage(fish: self.fish)

      VStack {
        Text(self.fish.name.nameEUfr)
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
          Text(self.fish.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.fish.hour)
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.fish.availability.location)
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(self.fish.price) clochettes")
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
    static var previews: some View {
      FishDetails(fish: Fish.sample)
    }
}
