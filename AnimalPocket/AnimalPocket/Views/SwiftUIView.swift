//
//  SwiftUIView.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 04/11/2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
      VStack {
        Text("ANIMAL CROSSING")
          .font(Font.custom("FinkHeavy", size: 50))
      }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
