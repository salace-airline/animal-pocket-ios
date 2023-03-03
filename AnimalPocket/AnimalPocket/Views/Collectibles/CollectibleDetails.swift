//
//  CollectibleDetails.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import SwiftUI

struct CollectibleDetails: View {
  @ObservedObject var viewModel: CollectibleViewModel
  var item: CollectibleItem
  
  var itemIndex: Int {
    viewModel.itemsArray.firstIndex(where: { $0.id == item.id }) ?? 404
  }
  
  var body: some View {
    VStack {
      CollectibleImage(item: self.item, background: "fond")
      
      HStack {
        Text(self.item.name.nameEUfr)
          .font(.system(size: 15))
          .bold()
        
        CollectedButton(isSet: $viewModel.itemsArray[itemIndex].isCollected,
                        setImage: "ant.circle.fill",
                        unsetImage: "ant.circle",
                        setColor: Colors.green100
        )
      }
      .padding(.bottom, 0.5)
      
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.item.availability.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.item.availability.hour)
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.item.availability.location ?? "")
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(self.item.price) clochettes")
        }
        
        RarityBadge(rarity: RarityViewModel(rarityLevel: item.availability.rarity ?? .common))
      }
      .font(.system(size: 11))
      .padding(.bottom, 5)
    }
    .frame(width: 175)
    .background(Colors.green100.opacity(0.1))
    .cornerRadius(4)
  }
}

