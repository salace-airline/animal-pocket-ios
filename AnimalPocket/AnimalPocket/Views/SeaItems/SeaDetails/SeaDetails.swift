//
//  SeaDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaDetails: View {
  var sea: Collectible
  
  var body: some View {
    VStack {
      SeaImage(sea: self.sea)
      
      VStack {
        Text(self.sea.name.nameEUfr)
          .font(.system(size: 15))
          .bold()
      }
      .padding(.bottom, 0.5)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.availability.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.availability.hour)
        }
        
        HStack {
          Text("Ombre:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.shadow ?? "")
        }
        
        HStack {
          Text("Vitesse:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text(self.sea.speed ?? "")
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.blue200)
            .bold()
          Text("\(self.sea.price) clochettes")
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
    SeaDetails(sea: Collectible.sample)
  }
}
