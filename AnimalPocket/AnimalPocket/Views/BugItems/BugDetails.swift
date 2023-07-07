//
//  BugDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugDetails: View {
  var bug: CollectibleItem
  
  var body: some View {
    VStack {
      CollectibleImage(item: self.bug, background: "fond")
      
      HStack {
        Text(self.bug.name.nameEUen.capitalized)
          .font(.system(size: 15))
          .bold()
      }
      .padding(.bottom, 0.5)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Period:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.period)
        }
        
        HStack {
          Text("Time:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.hour)
        }
        
        HStack {
          Text("Place:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.location ?? "")
        }
        
        HStack {
          Text("Price:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(self.bug.price) bells")
        }
        
        RarityBadge(rarity: RarityViewModel(rarityLevel: bug.availability.rarity ?? .common))
      }
      .font(.system(size: 11))
      .padding(.bottom, 5)
    }
    .frame(width: 175)
    .background(Colors.green100.opacity(0.1))
    .cornerRadius(4)
  }
}

struct BugDetails_Previews: PreviewProvider {
  static var previews: some View {
    BugDetails(bug: CollectibleItem.bugSample)
  }
}
