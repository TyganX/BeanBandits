//
//  ContentView.swift
//  Bean Bandits
//
//  Created by Tyler Keegan on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Resources()
                .tabItem() {
                    Image(systemName: "info.circle.fill")
                    Text("Resources")
                }

            About()
                .tabItem() {
                    Image(systemName: "ellipsis.message")
                    Text("About")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

