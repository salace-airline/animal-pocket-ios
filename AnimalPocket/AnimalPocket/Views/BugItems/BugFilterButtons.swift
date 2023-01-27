//
//  BugFilterButtons.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugFilterButtons: View {
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
    BugFilterButtons(isSelected: .constant(false), color: Colors.greenLight, buttonText: "Filter Off")
  }
}
