//
//  BugFilterButton.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 18/01/2023.
//

import SwiftUI

struct BugFilterButton: View {
  @Binding var isSelected: Bool
  @State var color: Color
  @State var buttonText: String
  
  var body: some View {
    Text(buttonText)
      .padding(5)
      .background(isSelected ? color : Colors.greenLight)
      .foregroundColor(.white)
      .cornerRadius(4)
  }
}

struct BugFilterButton_Previews: PreviewProvider {
  static var previews: some View {
    BugFilterButton(isSelected: .constant(false), color: Colors.greenLight, buttonText: "Filter Off")
  }
}


