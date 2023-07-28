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
    VStack(alignment: .leading) {
      VStack {
        CollectibleImage(item: fish, background: "fond_bleu")
        
        HStack {
          Text(fish.name.nameEUen.capitalized)
            .font(.system(size: 15))
            .bold()
        }
        .padding(.bottom, 0.5)
      }
      
      HStack {
        VStack(alignment: .leading) {
          HStack {
            Text("Period:")
          }
          HStack {
            Text("Time:")
          }
          HStack {
            Text("Place:")
          }
          HStack {
            Text("Price:")
          }
        }
        .foregroundColor(Colors.blue100)
        .bold()
        
        
        VStack(alignment: .leading) {
          HStack {
            Text(fish.availability.period)
          }
          
          HStack {
            Text(fish.availability.hour)
          }
          
          HStack {
            Text(fish.availability.location ?? "")
          }
          
          HStack {
            Text("\(fish.price) bells")
          }
        }
      }
      .padding(.leading, 10)
      
      
      RarityBadge(rarity: RarityViewModel(rarityLevel: fish.availability.rarity ?? .common)
      )
      .padding(
        EdgeInsets(
          top: 0,
          leading: 10,
          bottom: 10,
          trailing: 0
        )
      )
    }
    .font(.system(size: 11))
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
