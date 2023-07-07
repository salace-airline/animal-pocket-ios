//
//  SeaDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaDetails: View {
  var sea: CollectibleItem
  
  var body: some View {
    VStack {
      CollectibleImage(item: self.sea, background: "fond_violet")
      
      VStack {
        Text(self.sea.name.nameEUen.capitalized)
          .font(.system(size: 15))
          .bold()
      }
      .padding(.bottom, 0.5)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Period:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.availability.period)
        }
        
        HStack {
          Text("Time:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.availability.hour)
        }
        
        HStack {
          Text("Shadow:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.shadow ?? "")
        }
        
        HStack {
          Text("Speed:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.speed ?? "")
        }
        
        HStack {
          Text("Price:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text("\(self.sea.price) bells")
        }
      }
      .font(.system(size: 11))
      .padding(.bottom, 5)
    }
    .frame(width: 175)
    .background(Colors.blue200.opacity(0.1))
    .cornerRadius(4)
  }
}

struct SeaDetails_Previews: PreviewProvider {
  static var previews: some View {
    SeaDetails(sea: CollectibleItem.seaSample)
  }
}
