//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  var fish: Collectible
  
  var body: some View {
      VStack {
        FishImage(fish: self.fish)

        VStack {
          Text(self.fish.name.nameEUfr)
            .font(.system(size: 15))
            .bold()
        }
        .padding(.bottom, 0.5)
        
        // VStack below should go into a separate "item description" component
        VStack(alignment: .leading) {
          HStack {
            Text("Période:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.period)
          }
          
          HStack {
            Text("Heure:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.hour)
          }
          
          HStack {
            Text("Lieu:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.location ?? "")
          }
          
          HStack {
            Text("Ombre:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.shadow ?? "")
          }
          
          HStack {
            Text("Prix:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text("\(self.fish.price) clochettes")
          }
          
          RarityBadge(rarity: RarityViewModel(rarityLevel: fish.availability.rarity ?? .common))
        }
        .font(.system(size: 11))
        .padding(.bottom, 5)
      }
      .frame(width: 175)
      .background(Colors.blue100.opacity(0.1))
      .cornerRadius(4)
  }
}

struct GridItem_Previews: PreviewProvider {
    static var previews: some View {
      FishDetails(fish: Collectible.sample)
    }
}
