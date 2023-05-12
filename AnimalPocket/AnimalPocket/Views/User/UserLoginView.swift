//
//  UserLoginView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct UserLoginView: View {
  var body: some View {
    ZStack {
      Colors.beige200.ignoresSafeArea()
        .opacity(0.2)
      VStack {
        Spacer()
        
        Image("nookbestfriends")
          .resizable()
          .frame(width: 200, height: 200)
          .clipShape(Circle())
          .padding(.bottom, 50)
        
        Text("Hello User Name!")
          .font(.largeTitle).foregroundColor(Colors.blueDark)
          .padding([.top, .bottom], 40)
              
        LoginFormView()
        
        Spacer()
        
        Button(action: {}) {
          Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Colors.blueDark)
            .cornerRadius(10)
        }
        .padding(15)
                
        HStack(spacing: 0) {
          Text("Don't have an account? ")
          Button(action: {}) {
            Text("Sign Up")
              .foregroundColor(Colors.greenLight)
          }
        }
        .padding(.bottom, 15)
        
        Image("tide3")
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}

struct UserLoginView_Previews: PreviewProvider {
  static var previews: some View {
    UserLoginView()
  }
}
