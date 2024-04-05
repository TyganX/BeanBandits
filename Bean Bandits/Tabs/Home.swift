//
//  Home.swift
//  Bean Bandits
//
//  Created by Tyler Keegan on 4/2/24.
//

import SwiftUI

struct Home: View {
    @State private var showAlert = false  // State variable to control the alert visibility

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20.0) {
                Image("BeanBanditsLogo")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    Spacer()
                    
                    Text("Bean Bandits")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                    Button(action: {
                        // This will change the state, showing the alert
                        showAlert = true
                    }) {
                        Image(systemName: "quote.bubble.fill")
                    }
                    .alert(isPresented: $showAlert) {  // Alert presentation
                        Alert(
                            title: Text("Beanedict Cumberbandit"),
                            message: Text("Live by the Bean. Die by the bean.")
                        )
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 15))
            .padding()
        }
    }
}

struct Home_Previews:
    PreviewProvider{
    static var previews: some View {
        Home()
    }
}
