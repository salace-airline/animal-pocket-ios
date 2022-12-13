//
//  BugDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugDetails: View {
  var bug: Bug
  
  var body: some View {
    VStack {
      BugImage(bug: self.bug)
      
      VStack {
        Text(self.bug.name.nameEUfr)
          .font(.system(size: 15))
          .bold()
      }
      .padding(.bottom, 0.5)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.hour)
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.location)
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(self.bug.price) clochettes")
        }
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
    BugDetails(bug: Bug.sample)
  }
}
