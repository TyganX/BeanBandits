import SwiftUI

struct About: View {
    // Example data structure for each item
    struct GridItemModel: Identifiable {
        let id = UUID()
        let imageName: String // Image name for the button
        let label: String
        let url: URL // URL to open when the button is tapped
        
        // Action to open the URL
        func action() {
            UIApplication.shared.open(url)
        }
    }
    
    // Example grid items
    private let gridItems: [GridItemModel] = [
        GridItemModel(imageName: "globe", label: "Website", url: URL(string: "https://www.beanbandits.net")!),
        GridItemModel(imageName: "person.bubble.fill", label: "Discord", url: URL(string: "https://discord.gg/6VaNW9kJAd")!),
        GridItemModel(imageName: "paperplane.fill", label: "Telegram", url: URL(string: "https://t.me/BeanBandits")!),
        // Add more items as needed
    ]
    
    // Grid layout configuration
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Links").bold()) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(gridItems) { item in
                            Link(destination: item.url) {
                                VStack {
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30) // Fixed size for the image
                                    Text(item.label)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Remove the default button style
                        }
                    }
                }
            }
            .navigationTitle("About")
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
