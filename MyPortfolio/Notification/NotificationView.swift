//
//  NotificationView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var notificationManager = NotificationViewModel()
    @State var showFootnote = false
    
    var body: some View {
        VStack(spacing: 20) {
                 Button(action: {
                     withAnimation {
                         self.showFootnote.toggle()
                         //9. Use the send notification function
                         self.notificationManager.sendNotification(title: "Hurray!", subtitle: nil, body: "If you see this text, launching the local notification worked!", launchIn: 5)
                     }
                 }) {
                     Text("Launch Notification 🚨")
                 }
                 if showFootnote {
                     Text("Notification Arrives in 5 seconds, please go Home")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                 }
             }
                 .navigationBarTitle("Custom Notification", displayMode: .inline)
     }
 }

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
