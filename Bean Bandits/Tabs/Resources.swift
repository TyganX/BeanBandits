//
//  Resources.swift
//  Bean Bandits
//
//  Created by Tyler Keegan on 4/2/24.
//

import SwiftUI

struct URLButton: View {
    let label: String
    let systemImage: String
    let urlString: String

    var body: some View {
        Button(action: {
            openURL(urlString: urlString)
        }) {
            HStack {
                Label(label, systemImage: systemImage)
                Spacer()
                Image(systemName: "link")
                    .foregroundColor(.gray)
            }
        }
    }

    func openURL(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

struct Maps: View {
    var imageName: String

    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical, .horizontal], showsIndicators: false) {
                if let uiImage = UIImage(named: imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                } else {
                    Text("Image not found")
                }
            }
        }
    }
}

struct Resources: View {
    var body: some View {
        NavigationStack{
            List {
                Section("TEXAS RENAISSANCE FESTIVAL") {
                    URLButton(label: "Tickets", systemImage: "ticket.fill", urlString: "https://www.texrenfest.com/tickets")
                    
                    NavigationLink(destination: Maps(imageName: "TRFFestivalMap")) {
                        Label("Festival Map", systemImage: "map.fill")
                    }
                    
                    NavigationLink(destination: Maps(imageName: "TRFCampgroundMap")) {
                        Label("Campground Map", systemImage: "map.circle.fill")
                    }
                    
                    URLButton(label: "Lost & Found", systemImage: "questionmark.app.fill", urlString: "https://www.texrenfest.com/lost-and-found")
                    
                }
                Section("SHERWOOD FOREST FAIRE"){
                    URLButton(label: "Tickets", systemImage: "ticket.fill", urlString: "https://www.etix.com/ticket/v/12633/sherwood-forest-faire?cobrand=SherwoodForest")

                    NavigationLink(destination: Maps(imageName: "SFFFestivalMap")) {
                        Label("Festival Map", systemImage: "map.fill")
                    }
                    
                    NavigationLink(destination: Maps(imageName: "SFFCampgroundMap")) {
                        Label("Campground Map", systemImage: "map.circle.fill")
                    }

                    URLButton(label: "Performance Schedule", systemImage: "calendar", urlString: "https://www.sherwoodforestfaire.com/performance-schedule")
                    
                    URLButton(label: "Lost & Found", systemImage: "questionmark.diamond.fill", urlString: "https://docs.google.com/forms/d/e/1FAIpQLSfjtw__EmEXitzdBxUeoHEzXZOWcDJ4iBAzotlq8podyhe9AQ/viewform?fbclid=IwAR2UOFTry3PYHK-uevjDgaijKchnpfctJKWWGZC3rTnWcwVHKSxotq0W-dw_aem_ASwbpiQpCOwKBpjyMCjJR6_YL6afxNXs_uMhMXn_jwOjofyWRy44pXSwA93blZyT7qk")
                }
            }
                .navigationTitle("Resources")
        }
    }
}

struct Resources_Previews:
    PreviewProvider{
    static var previews: some View {
        Resources()
    }
}