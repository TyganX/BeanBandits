//
//  Resources.swift
//  Bean Bandits
//
//  Created by Tyler Keegan on 4/2/24.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // No action needed here.
    }
}

struct URLButton: View {
    let label: String
    let systemImage: String
    let urlString: String

    @State private var showingSafariView = false

    var body: some View {
        Button(action: {
            self.showingSafariView = true
        }) {
            HStack {
                Label(label, systemImage: systemImage)
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .fullScreenCover(isPresented: $showingSafariView) {
            if let url = URL(string: urlString) {
                SafariView(url: url)
                    .ignoresSafeArea()
            }
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
                Section(header: Text("BEAN BANDITS").bold()) {
                    URLButton(label: "Website", systemImage: "globe", urlString: "https://www.beanbandits.net")
                    
                    URLButton(label: "Discord", systemImage: "person.bubble.fill", urlString: "discord://discord.gg/bE5tkVdAt9")
                    
                    URLButton(label: "Telegram", systemImage: "paperplane.fill", urlString: "https://t.me/BeanBandits")
                }
                
                Section(header: Text("TEXAS RENAISSANCE FESTIVAL").bold()) {
                    URLButton(label: "Tickets", systemImage: "ticket.fill", urlString: "https://www.texrenfest.com/tickets")
                    
                    NavigationLink(destination: Maps(imageName: "TRFFestivalMap")) {
                        Label("Festival Map", systemImage: "map.fill")
                    }
                    
                    NavigationLink(destination: Maps(imageName: "TRFCampgroundMap")) {
                        Label("Campground Map", systemImage: "map.circle.fill")
                    }
                    
                    URLButton(label: "Lost & Found", systemImage: "questionmark.app.fill", urlString: "https://www.texrenfest.com/lost-and-found")
                }
                
                Section(header: Text("SHERWOOD FOREST FAIRE").bold()) {
                    URLButton(label: "Tickets", systemImage: "ticket.fill", urlString: "https://www.etix.com/ticket/v/12633/sherwood-forest-faire?cobrand=SherwoodForest")

                    NavigationLink(destination: Maps(imageName: "SFFFestivalMap")) {
                        Label("Festival Map", systemImage: "map.fill")
                    }
                    
                    NavigationLink(destination: Maps(imageName: "SFFCampgroundMap")) {
                        Label("Campground Map", systemImage: "map.circle.fill")
                    }

                    URLButton(label: "Performance Schedule", systemImage: "calendar", urlString: "https://www.sherwoodforestfaire.com/performance-schedule")
                    
                    URLButton(label: "Lost & Found", systemImage: "questionmark.app.fill", urlString: "https://docs.google.com/forms/d/e/1FAIpQLSfjtw__EmEXitzdBxUeoHEzXZOWcDJ4iBAzotlq8podyhe9AQ/viewform?fbclid=IwAR2UOFTry3PYHK-uevjDgaijKchnpfctJKWWGZC3rTnWcwVHKSxotq0W-dw_aem_ASwbpiQpCOwKBpjyMCjJR6_YL6afxNXs_uMhMXn_jwOjofyWRy44pXSwA93blZyT7qk")
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
