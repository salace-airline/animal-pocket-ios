//
//  GridItem.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct GridItem: View {
  var body: some View {
    VStack {
      // Image below will be a URL and can go into a separate "item image" component
      Image("Abeille naine")
        .background(Image("fond"))
        .clipShape(Rectangle())
        .overlay {
          Rectangle().stroke(Colors.green100, lineWidth: 2)
        }
        .shadow(radius: 2)
        .padding(.bottom, 10)
      
      VStack {
        Text("Abeille Naine")
          .font(.title)
          .bold()
      }
      .padding(.bottom, 2)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("Toute l'année")
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
    }
  }
}

struct GridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridItem()
    }
}
