//
//  ViewC.swift
//  Bean Bandits
//
//  Created by Tyler Keegan on 4/2/24.
//

import SwiftUI

struct Chat: View {
    @State private var isOpeningLink = false
    
    var body: some View {
        // Empty view
        Color.clear
            .onAppear {
                // Open the Telegram chat link when the tab appears
                openTelegramChatLink()
            }
    }
    
    func openTelegramChatLink() {
        if let url = URL(string: "https://t.me/BeanBandits") {
            UIApplication.shared.open(url)
        }
    }
}

struct Chat_Previews:
    PreviewProvider{
    static var previews: some View {
        Chat()
    }
}
