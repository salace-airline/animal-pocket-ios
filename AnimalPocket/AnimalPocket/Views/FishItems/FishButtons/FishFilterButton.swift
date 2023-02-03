//
//  FishFilterButton.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 20/01/2023.
//

import SwiftUI

struct FishFilterButton: View {
  @Binding var isSelected: Bool
  @State var color: Color
  @State var buttonText: String
  
  var body: some View {
    Text(buttonText)
      .padding(5)
      .background(isSelected ? color : Colors.blueLight)
      .foregroundColor(.white)
      .cornerRadius(4)
  }
}

struct FishFilterButton_Previews: PreviewProvider {
    static var previews: some View {
      FishFilterButton(isSelected: .constant(false), color: Colors.blueLight, buttonText: "Filter off")
    }
}
