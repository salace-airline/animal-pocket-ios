//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  var fish: CollectibleItem
  
  var body: some View {
      VStack {
        CollectibleImage(item: self.fish, background: "fond_bleu")

        VStack {
          Text(self.fish.name.nameEUen.capitalized)
            .font(.system(size: 15))
            .bold()
        }
        .padding(.bottom, 0.5)
        
        // VStack below should go into a separate "item description" component
        VStack(alignment: .leading) {
          HStack {
            Text("Period:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.period)
          }
          
          HStack {
            Text("Time:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.hour)
          }
          
          HStack {
            Text("Place:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.availability.location ?? "")
          }
          
          HStack {
            Text("Shadow:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text(self.fish.shadow ?? "")
          }
          
          HStack {
            Text("Price:")
              .foregroundColor(Colors.blue100)
              .bold()
            Text("\(self.fish.price) bells")
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
      FishDetails(fish: CollectibleItem.fishSample)
    }
}
