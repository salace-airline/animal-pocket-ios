//
//  SeaFilterButton.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 20/01/2023.
//

import SwiftUI

struct SeaFilterButton: View {
  @Binding var isSelected: Bool
  @State var color: Color
  @State var buttonText: String
  
  var body: some View {
    Text(buttonText)
      .padding(5)
      .background(isSelected ? color : Colors.bluePaleDark)
      .foregroundColor(.white)
      .cornerRadius(4)
  }
}

struct SeaFilterButton_Previews: PreviewProvider {
  static var previews: some View {
    SeaFilterButton(isSelected: .constant(false), color: Colors.bluePaleDark, buttonText: "Filter Off")
  }
}
